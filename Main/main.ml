open Ast

(* ocamlbuild -use-ocamlfind main.byte *)

let parse (s: string) : expr =
  let lexbuf = Lexing.from_string s in 
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let string_of_val (e: expr) : string = 
  match e with 
  | Int i -> string_of_int i
  | Binop _ -> _


let is_value : expr -> bool = function
 |Int _ -> true
 |Binop _ -> false

let rec step : expr -> expr = function
  | Int i -> failwith "Does not step"
  | Binop (bop, e1, e2) when is_value e1 && is_value e2 -> 
    step_bop bop e1 e2
  | Binop (bop, e1, e2) when is_value e1  -> Binop(bop, e1, step e2)
  | Binop (bop, e1, e2)  -> Binop (bop, step e1, e2)


and step_bop bop v1 v2 = match bop, v1, v2 with 
  | Add, Int a, Int b -> Int (a + b)
  | _ -> failwith "precondition violated"


let eval (e: expr) : expr = 
  if is_value e then e else 
    e |> step |> eval

let interp (s: string) : string =
  s |> parse |> eval |> string_of_val