open Test_lib
open Report

let () =
  nbmults := !nbmults - 3 (* solution *)

let important what =
  Message (what, Important)

let inform what =
  Message (what, Informative)

let test () =
  [ important [
      Text "This time, "; Code "x"; Text " is ";
      Code (string_of_int x);
      Text "."
  ] ] @

  test_variable_against_solution [%ty: int] "x_power_8" @

  [ inform [ Text "Testing how many times you multiplied."] ] @
  test_ref [%ty: int] nbmults 3

let () =
  set_result (ast_sanity_check code_ast test)
