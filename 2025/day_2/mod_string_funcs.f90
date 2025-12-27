MODULE mod_string_funcs
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: get_longest_range

CONTAINS

    FUNCTION get_longest_range(in_ranges, in_split_char) RESULT(out_longest_range)
        CHARACTER(:), ALLOCATABLE :: in_ranges
        INTEGER :: in_ranges_len
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: range_start
        INTEGER :: current_range_len
        INTEGER :: out_longest_range
        INTEGER :: i

        in_ranges_len = LEN(in_ranges)
        range_start = 1
        current_range_len = 1
        out_longest_range = 1

        DO i=1, LEN(in_ranges)
            IF (in_ranges(i:i) .EQ. in_split_char) THEN
                current_range_len = i - range_start
                range_start = i + 1
            END IF

            IF (i .EQ. LEN(in_ranges)) THEN
                current_range_len = (LEN(in_ranges) - range_start) + 1
            END IF

            IF (current_range_len .GT. out_longest_range) THEN
                out_longest_range = current_range_len
            END IF
        END DO

    END FUNCTION get_longest_range

END MODULE mod_string_funcs