type 'a arbre = Noeud of 'a * ('a arbre list);;
type 'a foret = 'a arbre list;;
type 'a bin = Feuille | Nd of('a bin) *  'a * ('a bin);;
