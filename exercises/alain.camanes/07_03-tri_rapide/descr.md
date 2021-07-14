Les fonctions suivantes attendent des listes dont les éléments sont de
n'importe quel type permettant l'utilisation des opérateurs de
comparaison génériques (`<`, `<=`, `=`, `>=`, `>`). Elles pourront
donc manipuler indifféremment des listes d'`int`, de `char`, etc.

**Question 1.** Écrire une fonction `split` qui étant donné un pivot et une liste renvoie trois listes dont la première est constituée des éléments strictement inférieurs au pivot, la seconde de ceux égaux au pivot et la troisième de ceux qui lui sont strictement supérieurs.

Exemple :
- `split 4 [1;2;3;1;5;1;7] = ([1; 2; 3; 1; 1], [4], [5; 7])`
- `split 3 [-1;4;3;1;5;0] = ([-1; 1; 0], [3; 3], [4; 5])|`

**Question 2.** Écrire une fonction `quicksort` qui implémente la
méthode du tri rapide sur une liste. Cette méthode fonctionne comme
suit pour trier une liste de taille `n`:
- si la liste est vide, on a fini;
- si la liste ne contient qu'un seul élément, on a fini;
- sinon, choisir le premier élément `a`, trier d'un côté tous les
  éléments inférieurs à `a`, d'un autre côté tous les éléments
  supérieurs à `a` et combiner les deux sous-listes triées en une seule
  liste triée.

On utiliser la fonction `split` précédente.