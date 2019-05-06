# Présentation de Learn-OCaml pour les CPGEs

Ce dépôt contient du matériel pédagogique pour les enseignants de
CPGEs souhaitant utiliser Learn-OCaml.

- `presentation.pdf` est le support de la présentation introductive.

- `exercices` contient trois exemples d'exercices

  - `bst` est un exercice utilisé pour présenter les fonctionnalités
	principales permettant d'écrire des auto-correcteurs. On commencera
	par lire `tests/test0.ml` puis `tests/test1.ml`, ... pour finir avec
	`tests/test3.ml`.

  - `mine` est un dossier à partir duquel on peut partir pour créer son
	propre exercice : il suffit de compléter chaque fichier en suivant les consignes
	données dans les commentaires.

  - `random_access_lists` est un exemple d'exercice complet et sophistiqué
	écrit par François Pottier.

Pour tester ce contenu, il vous suffit d'exécuter la commande:
``
% learn-ocaml
``
depuis la racine de ce dépôt si vous avez installé `learn-ocaml` sur votre machine.

Sinon, en utilisant docker, voici la commande à lancer depuis la racine du dépôt:
``
docker run -p 8080:8080 --rm -v $(pwd)/.:/repository -v learn-ocaml-sync:/sync ocamlsf/learn-ocaml
``

Vous pouvez ensuite vous connecter sur le [serveur local](http://localhost:8080)
à l'aide de votre navigateur favori (et récent!).

## Comment écrire mon premier exercice auto-corrigé?

1. Se rendre dans le répertoire `exercises/mine`.

2. Compléter le fichier `descr.md` avec votre énoncé.

3. Compléter le fichier `prelude.ml` pour y inclure les définitions préliminaires.

4. Compléter `solution.ml` avec la réponse à votre exercice.

5. Compléter `test.ml` en essayant de suivre la même progression que celle de
   `exercises/bst/tests/`.

**Attention** À chaque modification, il faut relancer le serveur *depuis la racine
du dépôt*.

## Quelques liens utiles

- [L'interface de la `Test_lib`](https://github.com/ocaml-sf/learn-ocaml/blob/master/src/grader/test_lib.mli)
- [L'interface du module `Report`](https://github.com/ocaml-sf/learn-ocaml/blob/master/src/grader/learnocaml_report.mli)
- [Le tutoriel officiel](https://github.com/ocaml-sf/learn-ocaml/blob/master/docs/howto-write-exercises.md)

## Comment obtenir de l'aide?

N'hésitez pas à poser vos questions (en anglais de préférence) sur
la (liste de diffusion)[https://sympa.inria.fr/sympa/subscribe/learn-ocaml-club].
