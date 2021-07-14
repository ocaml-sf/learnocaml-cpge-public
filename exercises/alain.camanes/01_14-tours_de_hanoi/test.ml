open Test_lib
open Report

let exercise_1 =
  test_function_4_against_solution
    [%ty: int -> string -> string -> string -> unit]
    "hanoi"
    ~gen:0
    [(2, "A", "B", "C"); (3, "A", "B", "C"); (5, "A", "B", "C")]

    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1
