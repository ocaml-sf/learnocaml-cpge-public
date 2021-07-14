Les fonctions suivantes attendent des listes dont les éléments sont de
n'importe quel type permettant l'utilisation des opérateurs de
comparaison génériques (`<`, `<=`, `=`, `>=`, `>`). Elles pourront
donc manipuler indifféremment des listes d'`int`, de `char`, etc.

**Question 1.** Écrire une fonction `insert` qui étant donnée une
liste supposée triée pour l'ordre strictement croissant et un élément
*x* renvoie la liste obtenue en insérant *x* à la bonne place. Si *x*
est déjà dans la liste, celle-ci sera renvoyée telle quelle.

Exemples :
- `insert 5 [1; 3; 8] = [1; 3; 5; 8]`
- `insert 'e' ['a'; 'c'; 'g'] = ['a'; 'c'; 'e'; 'g']`

**Question 2.** En utilisant la fonction `insert`, écrire une fonction
`sort` permettant de trier une `'a list` quelconque par ordre
croissant, en fusionnant les doublons.

Exemple : `sort [7; 8; 5; 2; 8] = [2; 5; 7; 8]`

Indication : comment obtenir `[2; 5; 7; 8]` à partir de *7* et de
`sort [8; 5; 2; 8]` ?