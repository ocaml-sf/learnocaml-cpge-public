open Test_lib
open Report

let exercise_1 =
  Section ([ Text "Function: ";
             Code "class3";
             Text " with multiple tested input types." ],
           test_function_3_against_solution
               [%ty: int -> int -> int -> int * int * int]
               "class3"
               ~gen:5 [] @
            test_function_3_against_solution
              [%ty: char -> char -> char -> char * char * char]
              "class3"
              ~gen:5 [] @
            test_function_3_against_solution
              [%ty: float -> float -> float -> float * float * float]
              "class3"
              ~gen:5 []
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [exercise_1]
