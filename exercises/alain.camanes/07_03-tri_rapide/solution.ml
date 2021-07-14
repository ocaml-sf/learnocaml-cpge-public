let rec split pivot liste =
  match liste with
  | [] -> [], [pivot], []
  | t::q -> let li, le, ls = split pivot q in
	    if t < pivot then (t::li, le, ls)
	    else (if t = pivot then (li, t::le, ls)
	      else (li, le, t::ls));;

let rec quicksort list =
  match list with
  | [] -> []
  | [t] -> [t]
  | t::q -> let li, le, ls = split t q in
	    (quicksort li)@(le@(quicksort ls));;
