open Test_lib
open Report

let success msg =
  [Message ([Text msg], Success 1)]

let fail msg =
  [Message ([Text msg], Failure)]

(******************************************************)
(* Some facilities to work with Binary Search Trees  **)
(******************************************************)

let leaf x = Node (Empty, x, Empty)

let rec repeat n f accu =
  if n = 0 then accu else repeat (n - 1) f (f accu)

let rec insert x = function
  | Empty -> leaf x
  | (Node (l, y, r)) as t ->
     let c = compare x y in
     if c = 0 then t
     else if c > 0 then Node (l, y, insert x r)
     else Node (insert x l, y, r)

let size = 20

let sample_bst sample_label () : Thing.t bst =
  repeat (Random.int size) (fun bst ->
      insert (sample_label ()) bst
    ) Empty

let rec elements = function
  | Node (l, x, r) -> elements l @ x :: elements r
  | Empty -> []

let pick l =
  let es = elements l in
  List.(nth es (Random.int (length es)))

let rec height = function
  | Empty -> 0
  | Node (l, x, r) -> 1 + max (height l) (height r)

(*********************)
(* Code inspection  **)
(*********************)

exception SeenWhile
let check_no_while cb =
  find_binding code_ast "mem" @@ fun expr ->
  (** [expr] is the abstract syntax trees for the body of "mem". *)

  (** The following predicate detects "while" at the root of the AST... *)
  let contains_while = Parsetree.(function
    | { pexp_desc = Pexp_while _ } -> raise SeenWhile
    | _ -> [])
  in
  try
    (** We apply it to each node of the AST. *)
    ast_check_expr ~on_expression:contains_while expr;
    (** No exception raised? Continue! *)
    cb ()
  with SeenWhile ->
    fail "Les boucles while sont interdites dans cet exercice!"

(************************)
(* Actual testing code **)
(************************)

let correct () =
  let sampler () =
    let t = sample_bst sample_thing () in
    if t <> Empty && Random.int 2 = 0 then
      (pick t, t)
    else
      (sample_thing (), t)
  and before_user _ _ =
    reset_comparison_counter ()
  and after _ tree out exp =
    if out <> exp then
      fail "Le calcul est incorrect."
    else if consumed_comparisons () > height tree then
      fail "Le nombre de comparaisons ne peut pas être plus grand \
            que la hauteur de l'arbre."
    else
      success "Bravo! Voici un calcul correct et efficace!"
  in
  test_function_2_against_solution
    ~gen:30 ~before_user ~sampler ~after
    [%ty : thing -> thing bst -> bool ] "mem"
    []

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  check_no_while            @@ fun () ->
  [ Section ([ Text "Function:" ; Code "mem" ], correct ()) ]
