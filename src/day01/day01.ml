let first_and_last_digits collected_numbers =
  (List.hd collected_numbers, List.hd (List.rev collected_numbers))

let is_this_a_valid_integer num =
  num >= '0' && num <= '9';;

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

let solve filename =
  let input_lines = Utils.read_input filename in
  let recovered_numbers = List.map recover_number input_lines in
  List.fold_left (fun acc x -> acc + x) 0 recovered_numbers
