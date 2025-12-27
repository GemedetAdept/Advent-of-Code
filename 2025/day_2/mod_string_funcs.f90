MODULE mod_string_funcs
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: get_max_string_len, get_string_count, get_alloc_array, split_string

CONTAINS

    FUNCTION get_max_string_len(in_string, in_split_char) RESULT(out_longest_string)
        CHARACTER(:), ALLOCATABLE :: in_string
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: in_string_len

        INTEGER :: string_start
        INTEGER :: current_string_len
        INTEGER :: out_longest_string
        INTEGER :: i

        in_string_len = LEN(in_string)
        string_start = 1
        current_string_len = 1
        out_longest_string = 1

        DO i=1, in_string_len
            IF (in_string(i:i) .EQ. in_split_char) THEN
                current_string_len = i - string_start
                string_start = i + 1
            END IF

            IF (i .EQ. in_string_len) THEN
                current_string_len = (in_string_len - string_start) + 1
            END IF

            IF (current_string_len .GT. out_longest_string) THEN
                out_longest_string = current_string_len
            END IF
        END DO

    END FUNCTION get_max_string_len

    FUNCTION get_string_count(in_string, in_split_char) RESULT(out_string_count)
        CHARACTER(:), ALLOCATABLE :: in_string
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: in_string_len

        INTEGER :: out_string_count
        INTEGER :: i

        in_string_len = LEN(in_string)
        out_string_count = 0

        DO i=1, in_string_len
            IF (in_string(i:i) .EQ. in_split_char) THEN
                out_string_count = out_string_count + 1
            END IF

            ! Account for the last string in the input
            IF (i .EQ. in_string_len) THEN
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

    FUNCTION split_string(in_string, in_split_char) RESULT(out_split_strings)
        CHARACTER(:), ALLOCATABLE :: in_string
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: in_string_len

        INTEGER :: max_string_len
        INTEGER :: string_count
        INTEGER :: string_start
        CHARACTER(:), ALLOCATABLE :: out_split_strings(:)
        CHARACTER(:), ALLOCATABLE :: current_string
        INTEGER :: string_iter
        INTEGER :: i

        in_string_len = LEN(in_string)

        max_string_len = get_max_string_len(in_string, in_split_char)
        string_count = get_string_count(in_string, in_split_char)

        ALLOCATE(CHARACTER(max_string_len) :: current_string)
        ALLOCATE(CHARACTER(max_string_len) :: out_split_strings(string_count))
        string_iter = 1
        string_start = 1

        DO i=1, in_string_len
            IF (in_string(i:i) .EQ. in_split_char) THEN
                current_string = in_string(string_start:i-1)
                out_split_strings(string_iter) = current_string

                string_start = i
                string_iter = string_iter + 1

            ELSE IF (i .EQ. in_string_len) THEN
                out_split_strings(string_iter) = in_string((string_start+1):i)
                WRITE(*,*) in_string((string_start+1):i)
            END IF
        END DO

    END FUNCTION split_string

END MODULE mod_string_funcs