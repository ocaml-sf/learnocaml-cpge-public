Dans les exemples, on considèrera l'arbre

`Nd (Feuille,
      5,
      Nd (
	Nd (
	  Nd (Feuille, 4, Feuille),
	  9,
	  Feuille),
	6,
	Nd (
	  Feuille,
	  1,
	  Nd (Feuille, 3, Feuille))))`

(**Question 1.**)
Écrire une fonction `liste_prefixe` qui renvoie la liste des étiquettes des noeuds d'un arbre binaire dans l'ordre préfixe.

`cheminement : 'a bin -> 'a list`

Par exemple, l'appel de la fonction sur l'arbre donné ci-dessus vaudra `[5; 6; 9; 4; 1; 3]`

Il est conseillé de dessiner l'arbre précédent sur une feuille de papier pour bien comprendre la question.

(**Question 2.**)
Écrire une fonction `liste_postfixe` qui renvoie la liste des étiquettes des noeuds d'un arbre binaire dans l'ordre postfixe.

`cheminement : 'a bin -> 'a list`

Par exemple, l'appel de la fonction sur l'arbre donné ci-dessus vaudra ` [4; 9; 3; 1; 6; 5]`


(**Question 3.**)
Écrire une fonction `liste_infixe` qui renvoie la liste des étiquettes des noeuds d'un arbre binaire dans l'ordre infixe.

`cheminement : 'a bin -> 'a list`

Par exemple, l'appel de la fonction sur l'arbre donné ci-dessus vaudra `[5; 4; 9; 6; 1; 3]`
