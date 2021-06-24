open Test_lib
open Report

let test () =
  test_function_2_against_solution
  [%ty: int -> int -> bool]
  "divides"
  ~gen:5
  [ (5, 2);
    (4, 2);
    (9, 3);
    (9, 5);
    (0, 1)
  ]

let () =
  set_result (ast_sanity_check code_ast test)
