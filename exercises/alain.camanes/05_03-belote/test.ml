open Test_lib
open Report

let exercise_1 =
  Section ([ Text "Question 1: " ; Code "point" ],
	   test_function_2_against_solution
	     [%ty: couleur -> carte -> int]
	     "point"
	     ~gen:0
	     [(Coeur, (Coeur, Neuf));
	      (Pique, (Coeur, Neuf));
	      (Trefle, (Carreau, As));
	      (Carreau, (Carreau, As))
	     ]
  )

let exercise_2 =
  Section ([ Text "Question 2: " ; Code "pli" ],
	   test_function_2_against_solution
	     [%ty: couleur -> carte list -> int]
	     "pli"
	     ~gen:0
	     [(Coeur, [(Coeur, Neuf);
		       (Trefle, Neuf);
		       (Carreau, As);
		       (Pique, As)]);
	      (Pique, [(Coeur, Valet);
		       (Trefle, Neuf);
		       (Carreau, As);
		       (Pique, As)])
	     ]
  )

    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    [exercise_1 ; exercise_2 ]
