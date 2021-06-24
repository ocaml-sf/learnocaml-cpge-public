let norme p1 p2=
  let (x1, y1) = p1 and x2, y2 = p2 in
  sqrt((x2-.x1)**2.+.(y1-.y2)**2.);;

let decoupe_mediane l =
  let rec aux k l =
    if k = 0 then [], l
    else let t::q = l in
	 let l1, l2 = aux (k-1) q in
	 (t::l1, l2)
  in
  match l with
  | [] -> [],[]
  | _ -> let n = List.length l
	 in aux (n/2) l;;

let rec fusion est_inferieur l1 l2 =
  match l1, l2 with
  | [], _ -> l2
  | _, [] -> l1
  | t1::q1, t2::q2 -> if est_inferieur t1 t2 then
      t1::(fusion est_inferieur q1 l2 )
    else t2::(fusion est_inferieur l1 q2);;

let rec tri est_inferieur l =
  match l with
  | [] -> []
  | [t] -> [t]
  | _ -> let l1, l2 = decoupe_mediane l in
	 fusion est_inferieur (tri est_inferieur l1) (tri est_inferieur l2);;

let x_tri l =
  let xinferieur p1 p2 =
    let x1, _ = p1 and
	x2, _ = p2 in
    x1 <= x2 in
  tri xinferieur l;;

let y_tri l =
  let yinferieur p1 p2 =
    let _, y1 = p1 and
	_, y2 = p2 in
    y1 <= y2 in
  tri yinferieur l;;

let rec bande xm d l =
  match l with
    [] -> []
  | (x,y)::q ->
    let l2 = bande xm d q in
    if abs_float (x -. xm) <= d then (x,y)::l2
    else l2;;

let rec min7 p0 plist =
  let rec aux p0 plist i d =
    match plist, i with
    | [], _ -> d
    | _, 8 -> d
    | t::q, i ->
      let d0 = norme p0 t and
	  d1 = aux p0 q (i+1) d in
      if d0 < d1 then d0 else d1
  in aux p0 plist 0 (norme p0 (List.hd plist));;
    
let rec dmin bande dg =
  match bande with
  | [] -> dg
  | [t] -> dg
  | t::q ->
    let d0 = dmin q dg and
	d1 = min7 t q
    in if d0 < d1 then d0 else d1;;
      
let rec distance_plus_proches l =
  match l with
    [] -> failwith "Pas de couple de points"
  | [t] -> failwith "Un seul couple de points"
  | [p1;p2] -> norme p1 p2
  | [p1;p2;p3] -> min7 p1 [p2;p3]
  | _ -> 
    let xl = x_tri l and yl = y_tri l in
    let l1, l2 = decoupe_mediane xl in
    let xmedian,_ = List.hd l2 in
    let dg1 = distance_plus_proches l1 and
	dg2 = distance_plus_proches l2 in
    let dg = if dg1 <= dg2 then dg1 else dg2 in
    let milieu = bande xmedian dg yl in
    dmin milieu dg;;
