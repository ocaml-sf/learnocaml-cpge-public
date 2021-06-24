Le tri du postier ne repose pas uniquement sur des comparaisons entre
éléments du tableau mais suppose également que ces éléments ne peuvent
prendre qu'un nombre fini de valeurs, supposées être des entiers
compris entre $0$ et $m-1$ pour simplifier. Ce tri est appelé
\defi{tri du postier} car il peut être utilisé pour trier des
enveloppes en fonction de leur adressage. On suppose que les éléments
des listes passées en arguments sont des tuples dont le premier
élément est un entier compris entre $0$ et $m-1$ (l'adresse) et le
second est une chaîne de caractères (la lettre). Par exemple, vous
pourrez trier par adresses croissantes :

`[|(10, "hello"); (1, "salut"); (0, "bonjour"); (9, "Buenos dias")|]`

**Question 1.**
Écrire une fonction `denombrement` qui, prend argument
l'entier `m` et un tableau d'adresses `tab`, puis renvoie un tableau
`occ` de taille `m` tell que pour tout entier `i`, `occ.(i)` soit égal
au nombre d'occurrences de `i` dans `tab`.

On veillera à ne parcourir la liste initiale qu'une seule fois.

`denombrement : int -> (int * 'a) array -> 'a array`

**Question 2.**
Écrire une fonction `place`, qui prend en argument l'entier `m` et un
tableau d'adresses `tab`, puis renvoie une liste `position` de taille
`m` tel que pour tout entier `i`, `position.(i)` sera la position de
la première lettre adressée à `i` dans le tableau trié issu de `tab`.

Plus précisément, en l'absence de courrier, `poosition.(0)` contiendra `0` et si `i` est non nul, `position.(i)` contiendra la position de la dernière lettre adressée à `i-1`.

`place : int -> (int * 'a) array -> 'a array`

**Question 3.**
Écrire une fonction `tri_postier` qui prend en
arguments l'entier `m` et un tableau d'adresses et renvoie ce tableau
trié en place en temps linéaire par rapport à sa longueur.

`tri_postier : int -> (int * 'a) array -> ()`
