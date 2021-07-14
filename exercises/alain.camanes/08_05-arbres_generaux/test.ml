open Test_lib
open Report

let rec builder h = match h with
  | 0 -> Noeud (Random.int 10, [])
  | n -> match Random.int 3 with
    | 0 -> Noeud (Random.int 10, [])
    | _ -> let k = Random.int 5 in
	   Noeud (Random.int 10, forest_builder (h-1) k)
	     
and forest_builder h k = match k with
  | 0 -> []
  | _ -> let a = builder h in
	 a :: (forest_builder h (k-1));;

let sample_int_gtree () =
  let h = Random.int 5 + 2 in
  builder h;;

let sample_int_forest () =
  let h = Random.int 5 + 2
  and k = Random.int 5 in
  forest_builder h k;;	       

  
let exercise_1 =
  Section ([ Text "Question 1: " ; Code "nb_feuilles_foret" ],
	   test_function_1_against_solution
	     [%ty: (int arbre) list -> int]
	     "nb_feuilles_foret"
	     ~sampler:(fun () ->  sample_int_forest ())
	     ~gen:5
	     []
  )

let exercise_2 =
  Section ([ Text "Question 2: " ; Code "nb_feuilles" ],
	   test_function_1_against_solution
	     [%ty: int arbre -> int]
	     "nb_feuilles"
	     ~sampler:(fun () ->  sample_int_gtree ())
	     ~gen:5
	     []
  )

let exercise_3 =
  Section ([ Text "Question 3: " ; Code "hauteur" ],
	   test_function_1_against_solution
	     [%ty: int arbre -> int]
	     "hauteur"
	     ~sampler:(fun () ->  sample_int_gtree ())
	     ~gen:5
	     []
  )


let exercise_4 =
  Section ([ Text "Question 4: " ; Code "arbre_vers_binaire" ],
	   test_function_1_against_solution
	     [%ty: int arbre -> int bin]
	     "arbre_vers_binaire"
	     ~sampler:(fun () ->  sample_int_gtree ())
	     ~gen:5
	     []
  )
    
    
let () =
  set_result @@
    ast_sanity_check code_ast @@ fun () ->
      [ exercise_1; exercise_2;
	exercise_3; exercise_4]
