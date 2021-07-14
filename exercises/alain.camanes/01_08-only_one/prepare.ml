exception ForbiddenOperation of string

let check op kind = fun x y ->
  if x <> 1 && y <> 1 then
    let what = Printf.sprintf "%s of %d and %d" kind x y in
    raise (ForbiddenOperation what)
  else
    op x y

let ( + ) = check ( + ) "an addition"

let ( - ) = check ( - ) "a substraction"
