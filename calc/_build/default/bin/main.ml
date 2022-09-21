open Calc

let () =
  let x = Main.parse "42" in
  print_string (Main.string_of_val x);
  Format.printf "@."
  
(* let () = 
  Format.printf "Hello\n" *)


let () = 
   let y = Main.parse Sys.argv.(1) in
    let x = Main.eval y in
    print_string (Main.string_of_val x);
    Format.printf "@."
  (* let () =
  ignore (Main.step (Obj.magic None)) *)
