open Test_lib
open Report

let test () =
  let test _ student expected =
    match student, expected with
    | Error (ForbiddenOperation what), _ ->
       let msg =
         Printf.sprintf
           "You did %s whereas this operation is not allowed."
           what
       in
       [Message ([ Text msg ], Success 0)]
    | Ok r1, Ok r2 ->
       if r1 = r2 then
         [Message ([Text "That's a correct modulo."], Success 1)]
       else
         [Message ([Text "That's an incorrect modulo."], Success 0)]
    | _, Error exn ->
       Printf.eprintf
         "Unexpected exception: %s\n"
         (Printexc.to_string exn);
       []
  in
  test_function_2_against_solution
    [%ty: int -> int -> int]
    "modulo"
    ~sampler:(fun () -> (Random.int 100+1, Random.int 100+1)) 
    ~gen:10
    ~test
    []
    
let () =
  set_result (ast_sanity_check code_ast test)


(* let exercise_1 = *)
  (* test_function_2_against_solution *)
    (* [%ty: int -> int -> int] *)
    (* "modulo" *)
    (* (\* ~sampler:(fun () -> (Random.int 100+1, Random.int 100+1)) *\) *)
    (* ~gen:5 *)
    (* [] *)

(* let () = *)
  (* set_result @@ *)
  (* ast_sanity_check code_ast @@ fun () -> *)
  (* exercise_1 *)
