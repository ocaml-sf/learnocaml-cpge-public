Les fonctions suivantes attendent des listes dont les éléments sont de
n'importe quel type permettant l'utilisation des opérateurs de
comparaison génériques (`<`, `<=`, `=`, `>=`, `>`). Elles pourront
donc manipuler indifféremment des listes d'`int`, de `char`, etc.

**Question 1.**
Écrire l'opération d'union de `union_sorted` de deux listes triées.

Exemples :
- `union_sorted [1; 3; 5] [2; 5; 8] = [1; 2; 3; 5; 8]`

Cette fonction devra être linéaire.

**Question 2.**
Écrire une fonction `split` qui renvoie deux listes, l'une contenant la moitié des éléments et l'autre le reste.

Exemples :
- `split [1;3;5;4;2] = [1;5;2], [3;4]`
- `split [1;5;2;3] = [1;2], [5;3]`

**Question 3.**
Écrire une fonction `mergesort` qui trie la liste en utilisant l'alogorithme de tri fusion. On utilisera les deux fonctions précédentes.