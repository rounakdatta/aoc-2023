let rec factorial n =
        if n <= 1 then 1 else n * factorial (n - 1)

let solve filename =
        let input_lines = Utils.read_input filename in
        let numbers = List.map int_of_string input_lines in
        List.fold_left (fun acc x -> acc + factorial x) 0 numbers
