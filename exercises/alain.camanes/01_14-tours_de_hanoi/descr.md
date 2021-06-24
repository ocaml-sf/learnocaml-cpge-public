On dispose de trois tiges `A`, `B`, `C` sur lesquelles s'enfilent des disques de tailles différentes. On déplace les disques un à un. Pour pouvoir déposer un disque sur une tige, son diamètre doit être plus petit que celui présent sur le haut de cette tige. Au départ, tous les disques se trouvent sur la tige `A`. Il faut empiler les disques sur la tige `C`. Vous déterminerez sa complexité.

`hanoi : int -> string -> string -> string -> unit`

**Exemple**
Dans le cas de deux disques, l'appel `hanoi 2 "A" "B" "C"` devra afficher :
`Deplacer le disque de A vers B`

`Deplacer le disque de A vers C`

`Deplacer le disque de B vers C`

**Indications.**
La fonction `print_string` permet d'afficher une chaîne de caractères.

La commande `^` permet de les concaténer.

Le `;` permet d'effectuer plusieurs effets de bords successivement.

La commande `print_newline ()` permet de passer à la ligne suivante.


