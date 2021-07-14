let rec hanoi n dep int arr =
  if n = 1 then
    (print_string ("Deplacer le disque de " ^ dep ^ " vers " ^ arr);
     print_newline ();)
  else (hanoi (n-1) dep arr int;
	print_string ("Deplacer le disque de " ^ dep ^ " vers " ^ arr);
	print_newline ();
	hanoi (n-1) int dep arr)
