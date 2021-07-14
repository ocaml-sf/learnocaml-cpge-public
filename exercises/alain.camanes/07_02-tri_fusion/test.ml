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
	([ Text "Function:" ; Code "union_sorted" ],
	 test_function_2_against_solution
           [%ty : int list -> int list -> int list ] "union_sorted"
	   ~gen:10
	   ~sampler:(fun () -> (rand_sorted 0 10, rand_sorted 0 10))
	   []
	);
      Section
	([ Text "Function:" ; Code "split" ],
	 test_function_1_against_solution
           [%ty : int list -> (int list * int list) ] "split"
	   ~gen:10
	   ~sampler:(fun () -> rand_sorted 0 10)
	   []
	);
      Section
	([ Text "Function:" ; Code "mergesort" ],
	 test_function_1_against_solution
           [%ty : int list -> int list ] "mergesort"
	   ~gen:10
	   []
	) 
    ]
