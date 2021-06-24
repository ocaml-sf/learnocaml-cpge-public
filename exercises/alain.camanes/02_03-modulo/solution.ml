let modulo a b =
  let (aa, bb) = if a < b then (a, b) else (b, a) in
  let r = ref bb in
  (* il existe un entier k tel que bb = r + k * aa *)
  while !r >= 0 do
    r := !r - aa
  done;
  !r + aa
