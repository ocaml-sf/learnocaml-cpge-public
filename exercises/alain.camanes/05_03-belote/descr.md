Nous avons défini dans le prélude des types permettant de représenter un jeu de 32 cates.

À la belote, lors d'un tour de jeu, un atout (une couleur) est choisi. La valeur des cartes dépend alors de leur couleur.

Pour les cartes de même couleur que l'atout, les valeurs (notées entre parenthèses) sont les suivantes :

7(0), 8(0), 9(14), 10(10), Valet(20), Dame(3), Roi(4), As(11)

Pour les cartes de couleur différente de celle de l'atout, les valeurs (notées entre parenthèses) sont les suivantes :

7(0), 8(0), 9(0), 10(10), Valet(2), Dame(3), Roi(4), As(11)


**Question 1.**
Écrire une fonction `point` qui, étant donnés une couleur d'atout et une carte, renvoie la valeur en nombre de points de cette carte.

`point : 'a -> 'a * valeur -> int`

En pratique, `'a` sera le type `couleur`.

**Question 2.**
Écrire une fonction `pli` qui, étant donnés une couleur d'atout et une liste de cartes modélisant un pli, renvoie la somme des valeurs de ces cartes.

`pli : 'a -> ('a * valeur) list -> int`

En pratique, `'a` sera le type `couleur`.