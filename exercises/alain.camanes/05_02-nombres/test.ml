open Test_lib
open Report

let exercise_1 =
  test_function_2_against_solution
    [%ty: nombre -> nombre -> nombre]
    "add_nombre"
    ~gen:0
    [(Entier 3, Entier 5);
     (Flottant 3.14, Flottant 1.414);
     (Entier 2, Flottant 2.4);
     (Flottant 2.4, Entier 5)]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
