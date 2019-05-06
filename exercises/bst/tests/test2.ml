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

(************************)
(* Actual testing code **)
(************************)

let sample_input () =
  let t = sample_bst sample_thing () in
  if t <> Empty && Random.int 2 = 0 then
    (pick t, t)
  else
    (sample_thing (), t)

let before_user _ _ =
    reset_comparison_counter ()

let after _ tree out exp =
  if out <> exp then
    fail "Le calcul est incorrect."
  else if consumed_comparisons () > height tree then
    fail "Le nombre de comparaisons ne peut pas être plus grand \
          que la hauteur de l'arbre."
  else
    success "Bravo! Voici un calcul correct et efficace!"

let correct () =
  test_function_2_against_solution
    ~gen:50 ~sampler:sample_input ~before_user ~after
    [%ty : thing -> thing bst -> bool ] "mem"
    []

let () =
  set_result @@
  [ Section ([ Text "Question 1" ; Code "mem" ], correct ()) ]
