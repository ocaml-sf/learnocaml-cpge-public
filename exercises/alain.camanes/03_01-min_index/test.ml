open Test_lib
open Report

let sampler_i =
  sample_array ~min_size:1 ~max_size:10 sample_int

let sampler_f =
  sample_array ~min_size:1 ~max_size:10 sample_float

let sampler_c =
  sample_array ~min_size:1 ~max_size:10 sample_char

    
let exercise_1 =
  Section ([ Text "Function: ";
             Code "min_index";
             Text " with multiple tested input types." ],
           test_function_1_against_solution
             [%ty: int array -> int]
             "min_index"
	     ~sampler:(sampler_i)
             ~gen:2 [[|1;2;3;4;5|];[|1;2;3;4;1|];[|1;2;3;4;4|]] @
             test_function_1_against_solution
             [%ty: float array -> int]
             "min_index"
	     ~sampler:(sampler_f)
             ~gen:2 [[|1.5;2.1;3.2;4.5;5.01|];[|1.2;2.2;3.4;4.6;1.2|];[|1.3;2.2;3.2;4.5;4.5|]] @
             test_function_1_against_solution
             [%ty: char array -> int]
             "min_index"
	     ~sampler:(sampler_c)
             ~gen:4 [[|'a';'w';'z'|]]
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    [exercise_1]
