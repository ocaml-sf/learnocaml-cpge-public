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
	([ Text "Function:" ; Code "insert" ],
	 test_function_2_against_solution
           [%ty : int -> int list -> int list] "insert"
	   ~gen:10
	   ~sampler:
	   (fun () ->
	     match Random.int 2 with
	       0 -> (sample_int (), rand_sorted 0 10)
	     | _ ->
		let n = 5 + Random.int 5 in
		let l = rand_sorted n n in
		(List.nth l (Random.int n), l)) 
	   []
	); 
      Section
	([ Text "Function:" ; Code "sort" ],
	 test_function_1_against_solution
           [%ty : int list -> int list ] "sort"
	   ~gen:10
	   []
	); 
    ]
