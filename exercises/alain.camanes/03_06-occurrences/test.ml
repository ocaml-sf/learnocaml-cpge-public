open Test_lib
open Report

let exercise_1 =
  test_function_2_against_solution
    [%ty: int array -> int -> int]
    "occurrences"
    ~gen:0
    [([|1;2;1;2;1;1;2;-1;0;1|], 0);
     ([|1;2;1;2;1;1;2;-1;0;1|], 1);
     ([|1;2;1;2;1;1;2;-1;0;1|], 2);
     ([|1;2;1;2;1;1;2;-1;0;1|], 3);
     ([|10;2;1;2;5;1;2;-1;0;10|], 10)
    ]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
