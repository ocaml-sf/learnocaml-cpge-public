let rec mem x = function
  | Empty ->
     false
  | Node (l, y, r) ->
     let cmp = compare y x in
     if cmp > 0 then mem x l
     else if cmp < 0 then mem x r
     else true
