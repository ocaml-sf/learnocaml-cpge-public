open Test_lib
open Report

let sample_int_array () =
  sample_array ~min_size:1 ~max_size:5 ~dups:false sample_int ()

let exercise_1 =
  let { before_reference ; before_user ; test } =
    array_arg_mutation_test_callbacks [%ty: int array]
  in
  let before_reference a _ = before_reference a in
  let before_user a _ = before_user a in
  test_function_2_against_solution
    ~before_reference ~before_user ~test
    [%ty: int array -> int -> unit]
    ~sampler:(fun () ->
      let a = sample_int_array () in
      (a, Random.int (Array.length a))
    )
    "tri_partiel"
    ~gen:3
    []

let exercise_2 =
  let { before_reference ; before_user ; test } =
    array_arg_mutation_test_callbacks [%ty: int array]
  in
  test_function_1_against_solution
    ~before_reference ~before_user ~test
    ~sampler:sample_int_array
    [%ty: int array -> unit]
    "tri_insertion"
    ~gen:3
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1 @ exercise_2
