open Test_lib
open Report

let exercise_1 =
  test_function_2_against_solution
    [%ty: int -> int -> int]
    "pgcd"
    ~sampler:(fun () -> (Random.int 1000, Random.int 1000))
    ~gen:4
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
