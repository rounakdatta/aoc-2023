let read_input filename =
        let channel = open_in filename in
        let rec read_lines acc =
                try
                        let line = input_line channel in
                        read_lines (line :: acc)
                with End_of_file -> List.rev acc
        in
        let lines = read_lines [] in
        close_in channel;
        lines

let write_output_file filename number =
        let channel = open_out filename in
        output_string channel (string_of_int number);
        close_out channel

let read_output_file filename =
        let channel = open_in filename in
        let number = int_of_string (input_line channel) in
        close_in channel;
        number
