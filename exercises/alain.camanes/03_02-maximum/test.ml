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
             Code "maximum";
             Text " with multiple tested input types." ],
           test_function_1_against_solution
             [%ty: int array -> int]
             "maximum"
	     ~sampler:(sampler_i)
             ~gen:5 [] @
             test_function_1_against_solution
             [%ty: float array -> float]
             "maximum"
	     ~sampler:(sampler_f)
             ~gen:5 [] @
             test_function_1_against_solution
             [%ty: char array -> char]
             "maximum"
	     ~sampler:(sampler_c)
             ~gen:5 []
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [exercise_1]
