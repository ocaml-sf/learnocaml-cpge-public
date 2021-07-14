Le type `'a arbre` permet de définir des arbres généraux, c'est-à-dire des arbres dont les noeuds peuvent avoir un nombre quelconque de fils.

Une feuille est un noeud dont l'ensemble des fils est la liste vide.

Le type `'a foret` permet de définir des listes d'éléments de types `'a arbre`.

(**Question 1.**)
Écrire une fonction `nb_feuilles_foret` qui renvoie la somme du nombres de feuilles de chacun des arbres de la forêt.

`nb_feuilles_foret` : `a foret -> int`

(**Question 2.**)
Écrire une fonction `nb_feuilles` qui renvoie le nombre de feuilles d'un arbre.

On pourra utiliser la fonction précédente en pensant qu'un arbre peut être une forêt...

`nb_feuilles : 'a arbre -> int`

(**Question 3.**)
Écrire une fonction `hauteur` qui renvoie la hauteur d'un arbre quelconque.

`hauteur : 'a arbre -> int`

On pourra s'inspirer de la stratégie adoptée dans les questions précédentes.

(**Question 4.**)
Dans cette question, on oublie la valeur des étiquettes et on s'intéresse uniquement au squelette des arbres. Pour ne pas introduire on nouveau type, on continue de travailler avec les types `a arbre` et `'a bin`.

Il existe une bijection entre les arbres généraux non étiquetés et ordonnés possédant n noeuds et l'ensemble des arbres binaires à n-1 noeuds.

Pour cela, en partant d'un arbre général, il suffit de mettre les enfants à gauche et les frères à droite.

Commencez par vous familiariser avec cette bijection sur des exemples.

Écrire ensuite une fonction `arbre_vers_binaire` qui, étant donné un arbre général, renvoie l'arbre binaire qui lui est associé via la bijection décrite précédemment.

`arbre_vers_binaire : 'a arbre -> 'a bin`
