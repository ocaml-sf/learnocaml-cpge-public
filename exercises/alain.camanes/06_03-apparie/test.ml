open Test_lib
open Report

let exercise_1 =
  test_function_2_against_solution
    [%ty: int list -> int list -> (int * int) list]
    "apparie"
    ~gen:3
    [([1;2;3], [2;1;5]);
     ([], []);
     ([10;1;3], [1;12;-5])
    ]
    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    exercise_1
