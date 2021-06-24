open Test_lib
open Report

let exercise_1 =
  test_function_1_against_solution
    [%ty: int -> bool]
    "bissextile"
    ~sampler:(fun () -> (Random.int 3000))
    ~gen:12
    [1998; 2000; 2011]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
