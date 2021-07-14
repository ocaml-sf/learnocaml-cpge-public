open Test_lib
open Report

let exercise_1 =
  test_function_1_against_solution
    [%ty: int -> bool]
    "est_premier"
    ~sampler:(fun () -> (Random.int 100+1))
    ~gen:8
    [169; 170]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
