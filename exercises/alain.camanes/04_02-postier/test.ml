open Test_lib
open Report

let sample_couple () =
  let n = 1 + Random.int 5 in
  let a = Array.make 10 (0, 'a') in
  for i = 0 to n do
    a.(i) <- (Random.int n, 'a')
  done;
  (n, a)

let exercise_1 =
  test_function_2_against_solution
    [%ty: int -> (int * char) array -> int array]
    "denombrement"
    ~sampler:sample_couple
    ~gen:5
    []


let exercise_2 =
  test_function_2_against_solution
    [%ty: int -> (int * char) array -> int array]
    "place"
    ~sampler:sample_couple
    ~gen:5
    []

let sample_int_string_array m =
  let sample_int_string () = (Random.int m, sample_string ()) in
  sample_array ~min_size:1 ~max_size:5 ~dups:false sample_int_string ()

let exercise_3 =
  let { before_reference ; before_user ; test } =
    array_arg_mutation_test_callbacks [%ty: (int * string) array]
  in
  let before_reference _ a = before_reference a
  and before_user _ a = before_user a
  in
  test_function_2_against_solution ~before_reference ~before_user ~test
    ~sampler: (fun () ->
      let m = 5 + Random.int 20 in
      let a = sample_int_string_array m in
      (m, a)
    )
    [%ty: int -> (int * string) array -> unit]
    "tri_postier"
    ~gen:5
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  exercise_1 @ exercise_2 @ exercise_3
