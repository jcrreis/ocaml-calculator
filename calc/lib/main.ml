open Ast

(* ocamlbuild -use-ocamlfind main.byte *)

let parse (s: string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let string_of_val (e: expr) : string =
  match e with
  | Int i -> string_of_int i


let is_value : expr -> bool = function
 |Int _ -> true

let step : expr -> expr = function
  | Int _i -> failwith "Does not step"

let rec eval (e: expr) : expr =
  if is_value e then e else
    e |> step |> eval

let interp (s: string) : string =
  s |> parse |> eval |> string_of_val
