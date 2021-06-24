let pascal n =
  let t = Array.make (n+1) [||] in
  for i = 0 to n do
    t.(i) <- Array.make (i+1) 1;
    (* t.(i).(j) = j parmi i *)
    for j = 1 to i-1 do
      t.(i).(j) <- t.(i-1).(j-1) + t.(i-1).(j)
    done;
  done;
  t
