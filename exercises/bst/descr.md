# Arbres binaires de recherche

Soit `thing` un type et soit `compare : thing -> thing -> int` une fonction qui
réalise un préordre total sur les valeurs de type `thing`. Deux valeurs
`a` et `b` sont équivalentes si `compare a b = 0`, `a` est plus petit
que `b` si `compare a b < 0` et `a` est plus grand que `b` si `compare
a b > 0`.

Un *arbre binaire de recherche* est un arbre binaire étiqueté par des valeurs
de type `t` et qui vérifie les invariants suivants:

- un arbre vide `Empty` est un arbre binaire de recherche ;
- `Node (l, x, r)` est un arbre binaire de recherche si
  - `l` et `r` sont des arbres binaires de recherche ;
  - pour toute étiquette `y` de `l`, `compare y x = -1` et
  - pour toute étiquette `x` de `r`, `compare y x =  1`.

**Question** Écrire une fonction récursive `mem : thing -> thing bst
-> bool` telle que `mem x t` renvoie `true` si et seulement si une
étiquette équivalente à `x` apparaît dans `t`. Minimiser le nombre
de comparaisons utilisées par votre fonction.
