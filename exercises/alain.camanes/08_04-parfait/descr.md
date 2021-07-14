Un arbre binaire est dit (**parfait**) si tous ses niveaux sauf éventuellement le dernier sont remplis. Dans ce cas, les feuilles du dernier niveau doivent être regroupées à gauche.

Écrire une fonction booléenne `est_parfait`.

`est_parfait : 'a bin -> bool`

On pourra faire intervenir une fonction auxiliaire récursive qui renvoie un couple `(h, b)` où `h` est la hauteur de l'arbre si l'arbre est parfait et `-1` sinon et `b` est un booléen qui vaut `true` si et seulement si l'arbre est complet (i.e. toutes ses feuilles ont la même hauteur).