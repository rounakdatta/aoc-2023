(* our solution would consider aligning red, green, blue in that order *)

(* we'll assume that the game ids are auto incrementing integers starting from 1 *)
let drop_game_id verbal_game_string_as_list =
  match verbal_game_string_as_list with
  | [] -> []
  | _ :: actual_picks -> actual_picks

let extract_out_number_and_colour verbal_pick =
  let regex = Str.regexp " \\([0-9]+\\) \\([a-z]+\\)" in
  if Str.string_match regex verbal_pick 0 then
    let number = Str.matched_group 1 verbal_pick in
    let colour = Str.matched_group 2 verbal_pick in
    (int_of_string number, colour)
  else
    (-1, "")
    
let rec find_value_for_colour colour pick_list =
  match pick_list with
  | [] -> 0
  | (number, c) :: rest ->
    if c = colour then number
    else find_value_for_colour colour rest

let parse_picks verbal_picks_list =
  verbal_picks_list
  (* separate out each colour *)
  |> List.map (Str.split (Str.regexp ","))
  |> List.map (List.map extract_out_number_and_colour)
  |> List.map (List.filter (fun (number, _) -> number <> -1))
  |> List.map (fun picks ->
      let red = find_value_for_colour "red" picks in
      let green = find_value_for_colour "green" picks in
      let blue = find_value_for_colour "blue" picks in
      (red, green, blue)
    )

let transform_to_game_format verbal_game_string =
  verbal_game_string
  (* separate out the `Game x:` section *)
  |> Str.split (Str.regexp ":")
  |> drop_game_id
  |> List.hd
  (* separate out each pick *)
  |> Str.split (Str.regexp ";")
  |> parse_picks

let solve_1 filename =
  let input_lines = Utils.read_input filename in
  let pick_counts = List.map transform_to_game_format input_lines in
  let pick_counts_indexed = List.mapi (fun i x -> (i, x)) pick_counts in

  let valid_games = List.filter (fun (_, list_of_picks) ->
      List.for_all (fun (red, green, blue) ->
          red <= 12 && green <= 13 && blue <= 14) list_of_picks
    ) pick_counts_indexed in
  
  List.fold_left (fun addup (i, _) -> addup + 1 + i) 0 valid_games

let solve_2 filename =
  let input_lines = Utils.read_input filename in
  let pick_counts = List.map transform_to_game_format input_lines in

  let cube_set_powers = List.map (fun list_of_picks ->
        List.fold_left (fun (red, green, blue) (r_max, g_max, b_max) ->
            (max red r_max, max green g_max, max blue b_max)
          ) (0, 0, 0) list_of_picks
      ) pick_counts
      |> List.map (fun (red, green, blue) -> red * green * blue) in

    List.fold_left (fun addup x -> addup + x) 0 cube_set_powers
  