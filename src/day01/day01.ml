let first_and_last_digits collected_numbers =
  (List.hd collected_numbers, List.hd (List.rev collected_numbers))

let is_this_a_valid_integer num =
  num >= '0' && num <= '9'

let convert_char_to_int num =
  int_of_char num - int_of_char '0'

let convert_tuple_to_number (first, last) =
  first * 10 + last

let recover_number cryptic_word =
  cryptic_word
  |> String.to_seq
  |> List.of_seq
  |> List.filter is_this_a_valid_integer
  |> List.map convert_char_to_int
  |> first_and_last_digits
  |> convert_tuple_to_number

let solve_1 filename =
  let input_lines = Utils.read_input filename in
  let recovered_numbers = List.map recover_number input_lines in
  List.fold_left (fun acc x -> acc + x) 0 recovered_numbers

let literal_number_mapping = [
  ("one", 1);
  ("two", 2);
  ("three", 3);
  ("four", 4);
  ("five", 5);
  ("six", 6);
  ("seven", 7);
  ("eight", 8);
  ("nine", 9);
]

(* we want to transform say `eight` to say `eight8eight` *)
let what_to_transform_literals_to head_key head_value =
  Str.global_replace (Str.regexp head_key) (Printf.sprintf "%s%d%s" head_key head_value head_key)

let rec cleverly_transform_word replace_mappings word =
  let tail_of_list list_of_things word =
    match list_of_things with
    | [] -> word
    | (head_key, head_value) :: tail -> 
        let replaced_word = what_to_transform_literals_to head_key head_value word in
        cleverly_transform_word tail replaced_word
    in
  tail_of_list replace_mappings word

let recover_number_again cryptic_word =
  cryptic_word
  |> cleverly_transform_word literal_number_mapping
  |> String.to_seq
  |> List.of_seq
  |> List.filter is_this_a_valid_integer
  |> List.map convert_char_to_int
  |> first_and_last_digits
  |> convert_tuple_to_number

let solve_2 filename =
  let input_lines = Utils.read_input filename in
  let recovered_numbers = List.map recover_number_again input_lines in
  List.fold_left (fun acc x -> acc + x) 0 recovered_numbers
