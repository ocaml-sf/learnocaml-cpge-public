open Test_lib
open Report

let exercise_1 =
  test_function_1_against_solution
    [%ty: int -> int]
    "somme_entiers"
    ~gen:10
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
