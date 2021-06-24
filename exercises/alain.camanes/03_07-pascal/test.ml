open Test_lib
open Report

let exercise_1 =
  test_function_1_against_solution
    [%ty: int -> int array array]
    "pascal"
    ~sampler:(fun () -> Random.int 10)
    ~gen:3
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
