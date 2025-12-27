MODULE mod_string_funcs
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: get_max_string_len, get_string_count, get_alloc_array

CONTAINS

    FUNCTION get_max_string_len(in_strings, in_split_char) RESULT(out_longest_string)
        CHARACTER(:), ALLOCATABLE :: in_strings
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: in_strings_len

        INTEGER :: string_start
        INTEGER :: current_string_len
        INTEGER :: out_longest_string
        INTEGER :: i

        in_strings_len = LEN(in_strings)
        string_start = 1
        current_string_len = 1
        out_longest_string = 1

        DO i=1, in_strings_len
            IF (in_strings(i:i) .EQ. in_split_char) THEN
                current_string_len = i - string_start
                string_start = i + 1
            END IF

            IF (i .EQ. in_strings_len) THEN
                current_string_len = (in_strings_len - string_start) + 1
            END IF

            IF (current_string_len .GT. out_longest_string) THEN
                out_longest_string = current_string_len
            END IF
        END DO

    END FUNCTION get_max_string_len

    FUNCTION get_string_count(in_strings, in_split_char) RESULT(out_string_count)
        CHARACTER(:), ALLOCATABLE :: in_strings
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: in_strings_len

        INTEGER :: out_string_count
        INTEGER :: i

        in_strings_len = LEN(in_strings)
        out_string_count = 0

        DO i=1, in_strings_len
            IF (in_strings(i:i) .EQ. in_split_char) THEN
                out_string_count = out_string_count + 1
            END IF

            ! Account for the last string in the input
            IF (i .EQ. in_strings_len) THEN
                out_string_count = out_string_count + 1
            END IF
        END DO
    END FUNCTION get_string_count

    FUNCTION get_alloc_array(in_max_len, in_count) RESULT(out_alloc_array)
        INTEGER :: in_max_len
        INTEGER :: in_count
        CHARACTER(:), ALLOCATABLE :: out_alloc_array(:)

        ALLOCATE(CHARACTER(in_max_len) :: out_alloc_array(in_count))
    END FUNCTION get_alloc_array

END MODULE mod_string_funcs