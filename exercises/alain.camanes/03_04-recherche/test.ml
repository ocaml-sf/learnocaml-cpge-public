open Test_lib
open Report

let exercise_1 =
  Section ([ Text "Function: ";
             Code "recherche_dichotomique";
             Text " with multiple tested input types." ],
           test_function_2_against_solution
             [%ty: int array -> int -> bool]
             "recherche_dichotomique"
	     ~gen:0
	     [([|1;2;3;4;6|], 1);
	      ([|1;2;3;4;6|], 6);
	      ([|1;2;3;4;6|], 3);
	      ([|1;2;3;4;6|], -2);
	      ([|1;2;3;4;6|], 8);
	      ([|1;2;3;4;6|], 5);
	     ]
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    [exercise_1]
