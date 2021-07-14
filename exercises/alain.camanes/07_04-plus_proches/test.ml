open Test_lib
open Report

let liste_points = [(2.,2.);(3.,3.);(2.1,2.2);(0.,0.);(1.,1.);(1.,0.);(0.,1.);(0.5,0.5)];;

let liste_points1 = [(2.,2.);(2.1,2.2);(3.,3.)];;

let liste_points2 = [(0.,0.);(0.,1.);(0.4,0.5);(0.5,0.5);(0.6,0.5);(1.,0.);(1.,1.)];;

let xinferieur p1 p2 =
  let x1, _ = p1 and
      x2, _ = p2 in
  x1 <= x2

let yinferieur p1 p2 =
  let _, y1 = p1 and
      _, y2 = p2 in
  y1 <= y2

let exercise_1 =
  Section ([ Text "Question 1: " ; Code "norme" ],
  test_function_2_against_solution
    [%ty: float*float -> float*float -> float]
    "norme"
    ~gen:2
    []
  )

let exercise_2 =
  Section ([ Text "Question 2: " ; Code "decoupe_mediane" ],
  test_function_1_against_solution
    [%ty: float list -> (float list * float list)]
    "decoupe_mediane"
    ~gen:2
    []
  )

let exercise_3 =
  Section ([ Text "Question 3: " ; Code "fusion" ],
  test_function_3_against_solution
    [%ty: ((float*float) -> (float*float) -> bool) -> (float*float) list -> (float*float) list -> (float*float) list]
    "fusion"
    ~gen:0
    [(xinferieur,liste_points1,liste_points2)]
  )

let exercise_4 =
  Section ([ Text "Question 4: " ; Code "tri" ],
  test_function_2_against_solution
    [%ty: ((float*float) -> (float*float) -> bool) -> (float*float) list -> (float*float) list]
    "tri"
    ~gen:0
    [(xinferieur,liste_points);
     (yinferieur,liste_points)]
  )
    
let exercise_5 =
  Section ([ Text "Question 5: " ; Code "x_tri" ],
  test_function_1_against_solution
    [%ty: (float * float) list -> (float*float) list]
    "x_tri"
    ~gen:2
    []
  )

let exercise_6 =
  Section ([ Text "Question 6: " ; Code "y_tri" ],
  test_function_1_against_solution
    [%ty: (float * float) list -> (float*float) list]
    "y_tri"
    ~gen:2
    []
  )

let exercise_7 =
  Section ([ Text "Question 7: " ; Code "bande" ],
  test_function_3_against_solution
    [%ty: float -> float -> (float * float) list -> (float*float) list]
    "bande"
    ~gen:2
    [(0.5, 0.1,liste_points2)]
  )

let exercise_8 =
  Section ([ Text "Question 8: " ; Code "min7" ],
  test_function_2_against_solution
    [%ty: float * float -> (float * float) list -> float]
    "min7"
    ~gen:2
    []
  )

let exercise_9 =
  Section ([ Text "Question 9: " ; Code "dmin" ],
  test_function_2_against_solution
    [%ty: (float * float) list -> float -> float]
    "dmin"
    ~gen:2
    []
  )

let exercise_10 =
  Section ([ Text "Question 10: " ; Code "distance_plus_proches" ],
  test_function_1_against_solution
    [%ty: (float * float) list -> float]
    "distance_plus_proches"
    ~gen:5
    []
  )
    
let () =
  set_result @@
    ast_sanity_check code_ast @@ fun () ->
      [ exercise_1; exercise_2;
	exercise_3; exercise_4;
	exercise_5; exercise_6;
	exercise_7; exercise_8;
	exercise_9; exercise_10]
