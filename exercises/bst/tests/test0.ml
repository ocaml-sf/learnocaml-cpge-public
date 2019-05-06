open Test_lib
open Report

(******************************************************)
(* Some facilities to work with Binary Search Trees  **)
(******************************************************)

let leaf x = Node (Empty, x, Empty)

(************************)
(* Actual testing code **)
(************************)

let test1 =
  let x = Thing.sample () in (x, leaf x)

let test2 =
  let x = Thing.sample () and y = Thing.sample () in (x, leaf y)

let correct () =
  test_function_2_against_solution
    ~gen:0
    [%ty : thing -> thing bst -> bool ] "mem"
    [test1; test2]

let () =
  set_result                @@
  [ Section ([ Text "Function:" ; Code "mem" ], correct ()) ]
