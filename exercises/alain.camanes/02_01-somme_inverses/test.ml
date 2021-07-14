open Test_lib
open Report

let exercise_1 =
  test_function_1_against_solution
    [%ty: int -> float]
    "somme_inverses"
    ~sampler:(fun () -> Random.int 100 + 1)
    ~gen:5
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
