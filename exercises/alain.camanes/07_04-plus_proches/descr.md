On propose, dans cette série de questions, d'écrire un algorithme de complexité quasi-linéaire qui permette de trouver la distance la plus courte entre des points du plans donnés sous forme de liste.

Les points du plans seront représentées par leurs coordonnées, c'est-à-dire un couple de flottants.

**Question 1.** Écrire une fonction `norme` qui renvoie la distance euclidienne entre deux points du plans.

`norme : float * float -> float * float -> float`

On continue avec une série de questions qui va permettre de trier la liste de points selon les abscisses puis selon les ordonnées croissantes. Cet algorithme fonctionnera avec l'algorithme de tri fusion.

**Question 2.** Écrire une fonction `decoupe_mediane` qui, étant donnée une liste `l` renvoie deux listes de mêmes tailles (à un élément près) `l1` et `l2` telles que `l1` soit la première partie de `l` et `l2` soit la seconde.

Exemple :
- `decoupe_mediane decoupe_mediane [(0., 1.); (0., 0.); (0.5, 0.5); (1., 1.); (1., 0.); (2., 2.); (2.1, 2.2); (3., 3.)] = ([(0., 1.); (0., 0.); (0.5, 0.5); (1., 1.)], [(1., 0.); (2., 2.); (2.1, 2.2); (3., 3.)])`


**Question 3.** Écrire une fonction `fusion` qui, étant donnée une fonction de comparaison `est_inferieur` et deux listes **triées** (selon la relation `est_inferieur` retourne l'union triée des deux listes et ce en temps linéaire.

`fusion : ('a -> 'a -> bool) -> 'a list -> 'a list -> 'a list`

**Question 4.** Écrire une fonction `tri` qui, étant donnée une fonction de comparaison et une liste renvoie la liste triée en utilisant l'algorithme de tri fusion (et donc les fonctions précédentes !).

`tri : ('a -> 'a -> bool) -> 'a list -> 'a list`

**Question 5.** Écrire une fonction `x_tri` qui étant donnée une liste de couples de flottants renvoie la liste triée selon leur première composante croissante. Cette fonction utilisera la fonction de tri précédente et pourra contenir une fonction auxiliaire définissant la comparaison des couples.

Exemple :
- `x_tri [(2., 2.); (3., 3.); (2.1, 2.2); (0., 0.); (1., 1.); (1., 0.); (0., 1.) = [(0., 1.); (0., 0.); (0.5, 0.5); (1., 1.); (1., 0.); (2., 2.); (2.1, 2.2); (3., 3.)]`

**Question 6.** Écrire une fonction `y_tri` qui étant donnée une liste de couples de flottants renvoie la liste triée selon leur seconde composante croissante.

Exemple :
- `y_tri [(2., 2.); (3., 3.); (2.1, 2.2); (0., 0.); (1., 1.); (1., 0.); (0., 1.) =  [(1., 0.); (0., 0.); (0.5, 0.5); (1., 1.); (0., 1.); (2., 2.); (2.1, 2.2);(3., 3.)]`

**Question 7.** Écrire une fonction `bande` qui, étant donnée une abscisse `xm`, une distance `d` et une liste `l` renvoie la liste des points (sans modifier l'ordre de la liste initiale) dont l'abscisse est à une distance au plus `d` de `xm`.

`bande : float -> float -> (float * 'a) list -> (float * 'a) list`

**Question 8.** Écrire une fonction `min7` qui étant donné un point `p0` et une liste `q` retourne la distance minimale de `p0` aux 7 premiers éléments de la liste `q`.

`min7 : float * float -> (float * float) list -> float`

**Question 9.** Écrire une fonction `dmin` qui, étant donnée une liste de points `l` et un réel `delta` renvoie le minimum entre `delta` et la plus petite distance de chacun des points de `l` à ses 7 successeurs. (Vous pouvez bien entendu utiliser la fonction `min7`).

`dmin : (float * float) list -> float -> float`

**Question 10.** Écrire une fonction `distance_plus_proches` qui, étant donnée une liste de points du plan, renvoie la distance minimale entre deux de ces points. Vous utiliserez l'algorithme vu dans le cours.

`distance_plus_proches : (float * float) list -> float`