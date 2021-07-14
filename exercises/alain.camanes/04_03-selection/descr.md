L'algorithme du tri par sélection consiste à placer successivement les plus petits éléments en tête de liste.

Dans cet exercice, on pourra utiliser une fonction `echange t i j` qui, étant donnés un tableau `t` et deux indices `i` et `j` échange les éléments d'indices `i` et `j` de `t`.

`echange : 'a array -> int -> int -> unit`

**Question 1.**
Écrire une fonction `mini` qui prend en argument un tableau `tab` de taille `n` et un entier naturel `i` et retourne le plus petit indice en lequel est atteint le minimum des éléments de l'ensemble ${`tab.(i)`,\ldots,`tab.(n-1)`}$.

`mini : 'a array -> int -> int`

**Question 2.**
En utilisant les fonctions `mini` et `echange`, écrire une fonction `tri_selection` qui trie la liste passée en argument (en la modifiant) selon la méthode de tri par sélection.

`tri_selection : 'a array -> unit`