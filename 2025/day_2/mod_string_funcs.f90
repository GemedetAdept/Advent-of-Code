MODULE mod_string_funcs
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_split_string, init_split_string, get_split_count, get_range_count, get_range_lens, get_split_indices, get_ranges

    TYPE t_split_string
        CHARACTER(LEN=:), ALLOCATABLE :: input_string
        CHARACTER(LEN=1) :: split_char
        INTEGER :: input_length = 0

        INTEGER, ALLOCATABLE :: split_indices(:)
        INTEGER :: split_count = 0
        INTEGER, ALLOCATABLE :: range_lens(:)
        INTEGER :: range_count = 0
        INTEGER :: range_max_len = 0

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

        in_t_split % split_count = split_count
    END SUBROUTINE get_split_count

    SUBROUTINE get_split_indices(in_t_split)
        INTEGER :: i, base_index

        TYPE(t_split_string) :: in_t_split
        INTEGER, ALLOCATABLE :: in_split_indices(:)
        CHARACTER(LEN=1) :: in_split_char
        CHARACTER(LEN=:), ALLOCATABLE :: in_string
        INTEGER :: in_string_len
        INTEGER :: in_split_count

        in_split_char = in_t_split % split_char
        in_string = in_t_split % input_string
        in_string_len = LEN(in_string)
        in_split_count = in_t_split % split_count
        base_index = 1

        ALLOCATE(in_split_indices(in_split_count))

        DO i=1, in_string_len
            IF (in_string(i:i) .EQ. in_split_char) THEN
                in_split_indices(base_index:base_index) = i
                base_index = base_index + 1
            END IF

            IF (i .EQ. in_string_len) THEN
                in_split_indices(base_index:base_index) = i+1
            END IF
        END DO

        in_t_split % split_indices = in_split_indices
    END SUBROUTINE get_split_indices

    SUBROUTINE get_range_count(in_t_split)

        TYPE(t_split_string) :: in_t_split
        INTEGER, ALLOCATABLE :: in_split_indices(:)
        INTEGER :: in_range_count

        in_split_indices = in_t_split % split_indices
        in_range_count = SIZE(in_split_indices)
        in_t_split % range_count = in_range_count

    END SUBROUTINE get_range_count

    SUBROUTINE get_range_lens(in_t_split)
        INTEGER :: i, base_index

        TYPE(t_split_string) :: in_t_split
        CHARACTER(LEN=:), ALLOCATABLE :: in_string
        CHARACTER(LEN=1) :: in_split_char
        INTEGER :: in_string_len
        INTEGER :: range_count
        INTEGER, ALLOCATABLE :: in_range_lens(:)
        INTEGER, ALLOCATABLE :: in_split_indices(:)


        in_string = in_t_split % input_string
        in_split_char = in_t_split % split_char
        in_string_len = in_t_split % input_length
        range_count = in_t_split % range_count
        in_split_indices = in_t_split % split_indices

        base_index = 1

        ALLOCATE(in_range_lens(range_count))

        DO i=1, range_count
            in_range_lens(i) = in_split_indices(i) - base_index

            base_index = in_split_indices(i) + 1
        END DO

        in_t_split % range_lens = in_range_lens
    END SUBROUTINE get_range_lens

    SUBROUTINE get_ranges(in_t_split)
        INTEGER :: i, base_index
        CHARACTER(LEN=:), ALLOCATABLE :: tmp_char

        TYPE(t_split_string) :: in_t_split
        CHARACTER(LEN=:), ALLOCATABLE :: in_string
        CHARACTER(LEN=:), ALLOCATABLE :: ranges(:)
        INTEGER, ALLOCATABLE :: in_split_indices(:)
        INTEGER, ALLOCATABLE :: in_range_lens(:)

        INTEGER :: in_string_len
        INTEGER :: range_count
        INTEGER :: range_max_len

        in_string = in_t_split % input_string
        in_string_len = in_t_split % input_length
        in_split_indices = in_t_split % split_indices

        in_range_lens = in_t_split % range_lens
        range_count = in_t_split % range_count
        range_max_len = MAXVAL(in_range_lens)

        ALLOCATE(CHARACTER(LEN=range_max_len) :: tmp_char)
        ALLOCATE(CHARACTER(LEN=range_max_len) :: ranges(range_count))

        base_index = 1
        DO i=1, range_count
            tmp_char = in_string(base_index:in_split_indices(i)-1)
            
            base_index = in_split_indices(i)+1
            
            ranges(i) = tmp_char
        END DO

        in_t_split % ranges = ranges
    END SUBROUTINE get_ranges

END MODULE mod_string_funcs