open Test_lib
open Report

let sample_int_array () =
  sample_array ~min_size:1 ~max_size:5 ~dups:false sample_int ()


let exercise_1 =
  test_function_2_against_solution
    [%ty: int array -> int -> int]
    ~sampler:(fun() ->
      let a = sample_int_array () in
      (a, Random.int (Array.length a)))
    "mini"
    ~gen:5
    []

let exercise_2 =
  let { before_reference ; before_user ; test } =
    array_arg_mutation_test_callbacks [%ty: int array]
  in
  test_function_1_against_solution
    ~before_reference ~before_user ~test
    ~sampler:sample_int_array
    [%ty: int array -> unit]
    "tri_selection"
    ~gen:5
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1 @ exercise_2
