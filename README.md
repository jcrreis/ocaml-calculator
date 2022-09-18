ocamlbuild -use-ocamlfind -no-hygiene  Main/main.byte
ocamlbuild -use-ocamlfind Main/main.byte
ocamlbuild -use-ocamlfind test.byte
#use "Main/main.ml";;

Test.function ;;
