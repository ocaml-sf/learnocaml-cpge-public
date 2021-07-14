open Test_lib
open Report

let sample_int_array () =
  sample_array ~min_size:1 ~max_size:5 ~dups:false sample_int ()

let sample_flag () =
  let n = Random.int 11 in
  let t = Array.make n 0 in
  for i = 0 to (n-1) do
    t.(i) <- (Random.int 3) - 1
  done; t

let sample_index a =
  Random.int (Array.length a)

let exercise_1 =
  let { before_reference ; before_user ; test } =
    array_arg_mutation_test_callbacks [%ty: int array]
  in
  let before_reference a _ _ = before_reference a
  and before_user a _ _ = before_user a
  in
  test_function_3_against_solution ~before_reference ~before_user ~test
    ~sampler: (fun () ->
      let a = sample_int_array () in
      (a, sample_index a, sample_index a)
    )
    [%ty: int array -> int -> int -> unit]
    "echange"
    ~gen:5
    []

let exercise_2 =
  let { before_reference ; before_user ; test } =
    array_arg_mutation_test_callbacks [%ty: int array]
  in
  test_function_1_against_solution
    ~before_reference ~before_user ~test
    ~sampler:sample_flag
    [%ty: int array -> unit]
    "dijkstra"
    ~gen:5
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1 @ exercise_2
