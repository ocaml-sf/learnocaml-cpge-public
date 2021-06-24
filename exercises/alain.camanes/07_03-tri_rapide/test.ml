open Test_lib
open Report

let () =
  let rand_sorted mn mx  =
    sample_list
      ~min_size:mn
      ~max_size:mx
      ~dups:false
      ~sorted:true
      sample_int () in 
  
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    [
      Section
	([ Text "Function:" ; Code "split" ],
	 test_function_2_against_solution
           [%ty : int -> int list -> (int list * int list * int list) ] "split"
	   ~gen:10
	   ~sampler:(fun () -> (sample_int (), rand_sorted 0 10))
	   []
	);
      Section
	([ Text "Function:" ; Code "quicksort" ],
	 test_function_1_against_solution
           [%ty : int list -> int list ] "quicksort"
	   ~gen:10
	   []
	) 
    ]
