open Test_lib
open Report

let exercise_1 =
  test_function_1_against_solution
    [%ty: int -> bool]
    "est_parfait"
    ~sampler:(fun () -> (Random.int 100 + 2))
    ~gen:7
    [6 ; 496 ; 8128]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
