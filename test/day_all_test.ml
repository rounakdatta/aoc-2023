let test_sample_with_assertion solver (day: int) (part: int) =
        let input_filename = Printf.sprintf "../inputs/day%02d_%d_sample.txt" day part in
        let expected_output_filename = Printf.sprintf "../outputs/day%02d_%d_sample.txt" day part in
        let expected_output = Utils.read_output_file expected_output_filename in

        let computed_output = solver input_filename in
        Printf.printf "Output for day %d part %d sample: %d\n" day part computed_output;

        assert (computed_output = expected_output)
;;

let test_with_result solver (day: int) (part: int) =
        let input_filename = Printf.sprintf "../inputs/day%02d_%d.txt" day part in
        let computed_output = solver input_filename in
        Printf.printf "Output for day %d part %d: %d\n" day part computed_output;
;;

(*
        sample part means the very basic test case that is included in the problem statement itself
        part 1 and part 2 are the real parts that count as solutions
*)

let () =
        (* day mic testing *)
        test_sample_with_assertion Day00.solve 0 1;
        test_with_result Day00.solve 0 1;

        (* day 1 part 1*)
        test_sample_with_assertion Day01.solve_1 1 1;
        test_with_result Day01.solve_1 1 1;

        (* day 2 part 2*)
        test_sample_with_assertion Day01.solve_2 1 2;
        test_with_result Day01.solve_2 1 2;

        (* day 2 part 1*)
        test_sample_with_assertion Day02.solve_1 2 1;
        test_with_result Day02.solve_1 2 1;
;;
