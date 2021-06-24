(**Question 1.**)
Soient `a` et `b` deux arbres binaires. L'arbre `a` est un sous-arbre de l'arbre `b` s'il existe un noeud de `b` tel que `a` soit le sous-arbre droit ou le sous-arbre gauche de ce noeud.

Écrire une fonction `est_sous_arbre` telle que l'appel `est_sous_arbre a b` détermine si l'arbre `a` est un sous-arbre de l'arbre `b`.

`est_sous_arbre : 'a bin -> 'a bin -> bool`

(**Question 2.**)
L'arbre `a` est inclus dans l'arbre `b` s'il s'obtient en supprimant certaines branches d'un sous-arbre de `b`.

Écrire une fonction `est_inclus` telle que l'appel `est_inclus a b` détermine si l'arbre `a` est inclus dans l'arbre `b`.

`est_inclus : 'a bin -> 'a bin -> bool`