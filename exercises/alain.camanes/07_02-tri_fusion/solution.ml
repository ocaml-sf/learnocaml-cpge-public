let rec union_sorted l1 l2 = match l1,l2 with
  | _,[] -> l1
  | [],_ -> l2
  | a1::l1',a2::l2' ->
     if a1 < a2 then a1::(union_sorted l1' l2 ) else
       if a2 < a1 then a2::(union_sorted l1  l2') else
         a1::(union_sorted l1' l2');;

let rec split l =
  match l with
  | [] -> [], []
  | [t] -> [t], []
  | e1::e2::q -> let l1, l2 = split q in
		 (e1::l1, e2::l2);;

let rec mergesort l =
  match l with
  | [] -> []
  | [t] -> [t]
  | _ -> let l1, l2 = split l in
         union_sorted (mergesort l1) (mergesort l2);;


mergesort [10;-4;1;3;-1;2;0;5];;
