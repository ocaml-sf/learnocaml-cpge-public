open Test_lib
open Report

let exercise_1 =
  test_function_2_against_solution
    [%ty: int -> int -> int]
    "puissance"
    ~sampler:(fun () -> (Random.int 32, Random.int 12))
    ~gen:4
    [(3,0)]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
