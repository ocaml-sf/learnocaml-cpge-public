(**

   This code redefines the multiplication operator to
   keep track of the number of multiplications used by
   the student.

*)
let _ = Random.self_init ()

let nbmults = ref 0

let ( * ) x y = incr nbmults; x * y
