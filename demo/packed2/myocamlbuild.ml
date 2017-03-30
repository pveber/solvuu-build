open Printf
open Solvuu_build.Std

let project_name = "my_project"
let version = "dev"

let lib : Project.item = Project.lib ("my_project_" ^ "lib")
  ~dir:"lib"
  ~style:(`Pack (project_name ^ "_lib"))
  ~install:(`Findlib (project_name ^ ".lib"))

let lib2 : Project.item = Project.lib ("my_project_" ^ "lib2")
  ~dir:"lib2"
  ~style:(`Pack (project_name ^ "_lib2"))
  ~install:(`Findlib (project_name ^ ".lib2"))

let ocamlinit_postfix = [
  sprintf "open %s" (String.capitalize_ascii project_name);
]

;;
let () =
  Project.basic1 ~project_name ~version [lib ; lib2] ~ocamlinit_postfix
