open Test_lib
open Report

let test () =
  test_function_2_against_solution
  [%ty: float -> float -> float]
  "norm"
  ~gen:10
  []

let () =
  set_result (ast_sanity_check code_ast test)
