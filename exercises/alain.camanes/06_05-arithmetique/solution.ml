let diviseurs_premiers n =
  let rec aux n i =
    match n mod i with
    | 0 when i = n-> [n]
    | 0 -> i :: (aux (n/i) i)
    | _ -> aux n (i+1)
  in aux n 2;;

let rec base m =
  match m with
  | 0 -> []
  | m -> (base (m/2)) @ [m mod 2];;
