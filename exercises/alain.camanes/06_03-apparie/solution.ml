let rec apparie l1 l2 =
  match l1,l2 with
  | [], [] -> []
  | t1::q1, t2::q2 -> (t1, t2) :: (apparie q1 q2)
  | _ -> failwith "Problème de tailles";;
