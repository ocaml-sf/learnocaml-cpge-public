let rec pgcd a b =
  if (a < 0 || b < 0) then pgcd (abs a) (abs b)
  else 
    (if a > b then pgcd b a
    else (if a = 0 then b
      else pgcd a (b mod a)))
