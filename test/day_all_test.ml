let test_with_assertion solver (day: int) (part: int) =
        let input_filename = Printf.sprintf "../inputs/day%02d_%d.txt" day part in
        let expected_output_filename = Printf.sprintf "../outputs/day%02d_%d.txt" day part in
        let expected_output = Utils.read_output_file expected_output_filename in

        let computed_output = solver input_filename in
        assert (computed_output = expected_output)
;;

let test_with_result solver (day: int) (part: int) =
        let input_filename = Printf.sprintf "../inputs/day%02d_%d.txt" day part in
        let computed_output = solver input_filename in
        Printf.printf "Output for day %d part %d: %d\n" day part computed_output;
;;

(*
        part 0 means the very basic test case that is included in the problem statement itself
        part 1 and part 2 are the real parts that count as solutions
*)

let () =
        (* day mic testing *)
        test_with_assertion Day00.solve 0 0;
        test_with_result Day00.solve 0 1;

        (* day 1 *)
        test_with_assertion Day01.solve 1 0;
        test_with_result Day01.solve 1 1;
;;
