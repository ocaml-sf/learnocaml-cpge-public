open Test_lib
open Report

let test () =
  let test _ student expected =
    match student, expected with
    | Error (ForbiddenOperation what), _ ->
       let msg =
         Printf.sprintf
           "You did %s while only additions and substractions to 1 are allowed."
           what
       in
       [Message ([ Text msg ], Success 0)]
    | Ok r1, Ok r2 ->
       if r1 = r2 then
         [Message ([Text "That's a correct addition."], Success 1)]
       else
         [Message ([Text "That's an incorrect addition."], Success 0)]
    | _, Error exn ->
       Printf.eprintf
         "Unexpected exception: %s\n"
         (Printexc.to_string exn);
       []
  in
    test_function_2_against_solution
    [%ty: int -> int -> int]
    "sum"
    ~gen:10
    ~test
    []

let () =
  set_result (ast_sanity_check code_ast test)
