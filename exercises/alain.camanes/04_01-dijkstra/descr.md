On considère un tableau d'entiers dont les éléments appartiennent à l'ensemble {-1, 0, 1}.

**Question 1.**
Écrire une fonction `echange t i j` qui, étant donnés un tableau `t` et deux indices `i` et `j` échange les éléments d'indices `i` et `j` de `t`.

`echange : 'a array -> int -> int -> unit`

**Question 2.**
Pour trier le tableau en un seul passage, on maintient trois compteurs :
<ul>
<li>le compteur `g` tel que tous les éléments à gauche de `g` soient des -1,</li>
<li>le compteur `d` tel que tous les éléments à droite de `d` soient des 1,</li>
<li>le compteur `i` tel que les éléments à gauche de `i` ont été triés.
</li>
</ul>
Écrire une fonction `dijkstra` qui trie en place le tableau passé en argument en un seul passage.

`dijkstra : int array -> unit`
