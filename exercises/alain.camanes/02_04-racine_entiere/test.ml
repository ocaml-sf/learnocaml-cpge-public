open Test_lib
open Report

let exercise_1 =
  test_function_1_against_solution
    [%ty: int -> int]
    "racine_entiere"
    ~sampler:(fun () -> (Random.int 1000+1))
    ~gen:7
    [16; 169; 170]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
