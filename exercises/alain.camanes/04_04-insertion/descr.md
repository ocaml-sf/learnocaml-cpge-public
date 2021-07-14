Le tri par insertion consiste à mettre successivement les éléments à leur place parmi les éléments déjà triés.

Dans cet exercice, on pourra utiliser une fonction `echange t i j` qui, étant donnés un tableau `t` et deux indices `i` et `j` échange les éléments d'indices `i` et `j` de `t`.

`echange : 'a array -> int -> int -> unit`

**Question 1.**
Écrire une fonction `tri_partiel` qui prend en argument un tableau `tab` dont on suppose que `tab.(0)` < ... < `tab.(i-1)` et l'entier `i` et qui insère l'élément `tab.(i)` à sa place parmi les `i` premiers éléments de `tab` (en modifiant ce dernier).

`tri_partiel : 'a array -> int -> unit`

Cette fonction utilisera la fonction `echange`  uniquement avec deux indices consécutifs en faisant remonter les éléments à leur place.

**Question 2.**
Écrire une fonction `tri_insertion` qui trie le tableau passé en argument (en le modifiant) selon la méthode du tri par insertion.

`tri_insertion : 'a array -> unit`
