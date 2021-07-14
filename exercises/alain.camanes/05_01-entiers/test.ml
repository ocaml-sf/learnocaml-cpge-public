open Test_lib
open Report

let exercise_1 =
  test_function_2_against_solution
    [%ty: entiers -> entiers -> entiers]
    "add_entiers"
    ~gen:0
    [(Zero, S (S Zero));
     (S (S (S Zero)), Zero);
     (S (S (S Zero)), S (S Zero))]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
