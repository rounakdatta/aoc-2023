let test_with_assertion () =
        let input_filename = "../inputs/day00_0.txt" in
        let expected_output_filename = "../outputs/day00_0.txt" in
        let expected_output = Utils.read_output_file expected_output_filename in

        let computed_output = Day00.solve input_filename in
        assert (computed_output = expected_output)
;;

let test_with_result (part: int) =
        let input_filename = Printf.sprintf "../inputs/day00_%d.txt" part in
        let output_filename = Printf.sprintf "../outputs/day00_%d.txt" part in

        let computed_output = Day00.solve input_filename in
        Printf.printf "Output for part %d: %d\n" part computed_output;
        (* TODO: figure out why the output file writing isn't working *)
        Utils.write_output_file output_filename computed_output;
;;

let () =
        test_with_assertion ();
        test_with_result 1;
;;
