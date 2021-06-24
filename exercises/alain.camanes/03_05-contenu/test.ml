open Test_lib
open Report

let sample_5 () =
  let n = Random.int 9 + 1 in
  let a = Array.make n 0 in
  for i = 0 to n-1 do
    a.(i) <- Random.int 10
  done;
  a;;



let exercise_1 =
  Section ([ Text "Question 1: " ; Code "present" ],
  test_function_2_against_solution
    [%ty: int array -> int -> bool]
    "present"
    ~sampler:(fun () -> (sample_5 (), Random.int 10))
    ~gen:2
    [([|1;3;1;2;4|], 1);
     ([|1;3;1;2;4|], 4);
     ([|1;3;1;2;4|], 0)
    ]
  )


let exercise_2 =
  Section ([ Text "Question 2: " ; Code "inclus" ],
	   test_function_2_against_solution
    [%ty: int array -> int array -> bool]
    "inclus"
    ~sampler:(fun () -> (sample_5 (), sample_5 ()))
    ~gen:2
    [([|1;3;1;2;4|], [|3;1;2;4|]);
     ([|1;3;1;2;4|], [|3;1;2;4;5|]);
     ([|1;3;1;2;4|], [|6;9|])
    ]
  )

let exercise_3 =
  Section ([ Text "Question 3: " ; Code "meme_support" ],
	   test_function_2_against_solution
    [%ty: int array -> int array -> bool]
    "meme_support"
    ~sampler:(fun () -> (sample_5 (), sample_5 ()))
    ~gen:2
    [([|1;3;1;2;4|], [|3;1;2;4|]);
     ([|1;3;1;2;4|], [|3;1;2;4;5|]);
     ([|1;3;1;2;4|], [|6;9|])
    ]
  )

    
    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [exercise_1 ; exercise_2 ; exercise_3]
