open Test_lib
open Report


let exercise_1 =
  test_function_2_against_solution
    [%ty: bool -> bool -> bool]
    "imply"
    ~gen:0
    [(true, true); (true, false); (false, true); (false, false)]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
