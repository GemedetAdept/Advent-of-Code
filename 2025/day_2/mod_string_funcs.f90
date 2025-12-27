MODULE mod_string_funcs
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: get_max_string_len

CONTAINS

    FUNCTION get_max_string_len(in_strings, in_split_char) RESULT(out_longest_string)
        CHARACTER(:), ALLOCATABLE :: in_strings
        INTEGER :: in_strings_len
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: string_start
        INTEGER :: current_string_len
        INTEGER :: out_longest_string
        INTEGER :: i

        in_strings_len = LEN(in_strings)
        string_start = 1
        current_string_len = 1
        out_longest_string = 1

        DO i=1, LEN(in_strings)
            IF (in_strings(i:i) .EQ. in_split_char) THEN
                current_string_len = i - string_start
                string_start = i + 1
            END IF

            IF (i .EQ. LEN(in_strings)) THEN
                current_string_len = (LEN(in_strings) - string_start) + 1
            END IF

            IF (current_string_len .GT. out_longest_string) THEN
                out_longest_string = current_string_len
            END IF
        END DO

    END FUNCTION get_max_string_len

END MODULE mod_string_funcs