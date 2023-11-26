let () =
        let input_filename = "../inputs/day00.txt" in
        let expected_output = 150 in
        let actual_output = Day00.solve input_filename in
        assert (actual_output = expected_output)
