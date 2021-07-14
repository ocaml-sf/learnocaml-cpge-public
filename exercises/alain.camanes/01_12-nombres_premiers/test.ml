open Test_lib
open Report

let exercise_1 =
  Section ([ Text "Question 1: " ; Code "existe_multiple_inferieur" ],
  test_function_2_against_solution
    [%ty: int -> int -> bool]
    "existe_multiple_inferieur"
    ~sampler:(fun () -> (Random.int 100 + 2, Random.int 100 + 2))
    ~gen:10
    [(169, 13); (121, 10)]
  )


let exercise_2 =
  Section ([ Text "Question 2: " ; Code "est_premier" ],
	   test_function_1_against_solution
    [%ty: int -> bool]
    "est_premier"
    ~sampler:(fun () -> (Random.int 50 + 2))
    ~gen:6
    [169; 121; 2; 59]
  )
    
let () =
  set_result @@
    ast_sanity_check code_ast @@ fun () ->
      [ exercise_1 ; exercise_2]
