open Test_lib
open Report

let inform what =
  Message (what, Informative)

let test () =
  inform [
      Text "I first check with ";
      Code "fun x -> x";
      Text "and then with";
      Code "fun x -> -x";
    ]
  ::
  test_function_1_against_solution
  [%ty: (int -> int) -> bool]
  "increase_between_0_1"
  ~gen:0
  [
    (fun x -> x);
    (fun x -> -x)
  ]

let () =
  set_result (ast_sanity_check code_ast test)
