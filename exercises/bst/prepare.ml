let comparison_counter = ref 0

let reset_comparison_counter () = comparison_counter := 0

let consumed_comparisons () = !comparison_counter

module Thing : sig
  type t = int
  val compare : t -> t -> int
  val sample : unit -> t
end = struct
  type t = int
  let sample () = Random.bits ()
  let compare x y =
    incr comparison_counter;
    compare x y
end

type thing = Thing.t
let sample_thing = Thing.sample
let compare = Thing.compare
