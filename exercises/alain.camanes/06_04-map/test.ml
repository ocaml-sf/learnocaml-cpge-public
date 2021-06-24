open Test_lib
open Report

let exercise_1 =
  test_function_2_against_solution
    [%ty: (int -> int) -> int list -> int list]
    "mappe"
    ~gen:0
    [((fun x -> 4 * x), [1;2;3]);
     ((fun x -> 4 * x), []);
     ((fun x -> x * x), [12;1;24;16])
    ]
    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    exercise_1
