open Core

let spec =
  let open Command.Spec in
  empty
  +> anon ("analysis" %: string)

let handle_command cmd =
  let r2 = R2.of_pipe () in
  match cmd with
  | "hello" -> Analysis.hello ~r2
  | _ -> failwith "Unkonwn analysis"

let command =
  Command.basic
    ~summary:"Entry point of my Radare pipe libary"
    ~readme:(fun () -> "Handle libary request from R2")
    spec
    (fun cmd () -> handle_command cmd)

let () =
  Command.run command
