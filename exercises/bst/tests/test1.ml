open Test_lib
open Report

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

(************************)
(* Actual testing code **)
(************************)

let sample_input () =
  let t = sample_bst sample_thing () in
  if t <> Empty && Random.int 2 = 0 then
    (pick t, t)
  else
    (sample_thing (), t)

let correct () =
  test_function_2_against_solution
    ~gen:50 ~sampler:sample_input
    [%ty : thing -> thing bst -> bool ] "mem"
    []

let () =
  set_result @@
  [ Section ([ Text "Question 1" ; Code "mem" ], correct ()) ]
