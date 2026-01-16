MODULE mod_string_funcs
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_split_string, init_split_string, get_split_count

    TYPE t_split_string
        CHARACTER(LEN=:), ALLOCATABLE :: input_string
        CHARACTER(LEN=1) :: split_char
        INTEGER :: input_length = 0

        INTEGER, ALLOCATABLE :: split_indices(:)
        INTEGER, ALLOCATABLE :: range_len_arr(:)
        INTEGER :: range_count = 0
        INTEGER :: max_range_len = 0

        CHARACTER(LEN=:), ALLOCATABLE :: ranges(:)
    END TYPE t_split_string

CONTAINS

    SUBROUTINE init_split_string(in_t_split)
        TYPE(t_split_string) :: in_t_split
        INTEGER :: in_string_len

        in_string_len = LEN(in_t_split % input_string)
        in_t_split % input_length = in_string_len
    END SUBROUTINE init_split_string

    SUBROUTINE get_split_count(in_t_split)
        INTEGER :: i, split_count

        TYPE(t_split_string) :: in_t_split
        CHARACTER(LEN=:), ALLOCATABLE :: in_string
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: in_string_len

        in_string = in_t_split % input_string
        in_split_char = in_t_split % split_char
        in_string_len = in_t_split % input_length

        split_count = 0
        DO i=1, in_string_len
            IF (in_string(i:i) .EQ. in_split_char) THEN
                split_count = split_count + 1
            END IF

            IF (i .EQ. in_string_len) THEN
                split_count = split_count + 1
            END IF
        END DO

        ALLOCATE(in_t_split % split_indices(split_count))

    END SUBROUTINE get_split_count

END MODULE mod_string_funcs