let echange tab i j =
  let valeur = tab.(i) in
  tab.(i) <- tab.(j);
  tab.(j) <- valeur;;

let dijkstra tab =
  let rec aux_dijkstra i bleu rouge =
    if i > rouge then ()
    else if tab.(i) = 0 then aux_dijkstra (i+1) bleu rouge
    else if tab.(i) = -1 then 
      (echange tab i bleu;
       aux_dijkstra (i+1) (bleu+1) rouge)
    else (echange tab i rouge;
          aux_dijkstra i bleu (rouge-1))
  in aux_dijkstra 0 0 (Array.length tab - 1);;
