open Test_lib
open Report

let carre x = x *. x -. 2.

let f2 x = x -. 2.
  
let exercise_1 =
  test_function_4_against_solution
    [%ty: (float -> float) -> float -> float -> float -> float]
    "dichotomie"
    ~gen:0
    [(cos, 0., 2., 0.001); (carre, 0., 2., 0.001); (f2, 0., 4., 0.001)]

    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
