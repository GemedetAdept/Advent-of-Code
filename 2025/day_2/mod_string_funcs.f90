MODULE mod_string_funcs
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_split_string, init_split_string, get_split_count, get_range_count, get_range_lens

    TYPE t_split_string
        CHARACTER(LEN=:), ALLOCATABLE :: input_string
        CHARACTER(LEN=1) :: split_char
        INTEGER :: input_length = 0

        INTEGER, ALLOCATABLE :: split_indices(:)
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
    END SUBROUTINE get_split_count

    SUBROUTINE get_range_count(in_t_split)

        TYPE(t_split_string) :: in_t_split
        INTEGER, ALLOCATABLE :: in_split_indices(:)
        INTEGER :: in_range_count

        in_split_indices = in_t_split % split_indices
        in_range_count = SIZE(in_split_indices)
        in_t_split % range_count = in_range_count

    END SUBROUTINE get_range_count

    SUBROUTINE get_range_lens(in_t_range)
        INTEGER :: i

        TYPE(t_split_string) :: in_t_range
        INTEGER, ALLOCATABLE :: in_range_lens(:)
        INTEGER, ALLOCATABLE :: in_split_indices(:)

        INTEGER :: in_string_len
        INTEGER :: in_range_count
        INTEGER :: in_range_max_len

        in_string_len = in_t_range % input_length
        in_range_count = in_t_range % range_count
        in_range_max_len = in_t_range % range_max_len

        ALLOCATE(in_split_indices(in_range_count))
        ALLOCATE(in_range_lens(in_range_count))

        WRITE(*,*) in_split_indices

        DO i=1, in_range_count
            in_range_lens(i) = in_split_indices(i)
        END DO

        in_t_range % range_lens = in_range_lens

    END SUBROUTINE get_range_lens
    ! SUBROUTINE populate_ranges(in_t_split)
    !     INTEGER :: i

    !     TYPE(t_split_string) :: in_t_split
    !     CHARACTER(LEN=:), ALLOCATABLE :: in_string
    !     CHARACTER(LEN=1) :: in_split_char
    !     INTEGER :: in_string_len

    !     INTEGER, ALLOCATABLE :: in_split_indices(:)
    !     INTEGER, ALLOCATABLE :: in_range_lens(:)
    !     CHARACTER(LEN=:), ALLOCATABLE :: in_ranges(:)

    !     INTEGER :: index_start
    !     INTEGER :: in_range_count
    !     INTEGER :: current_range_len
    !     CHARACTER(LEN=:), ALLOCATABLE :: substring_range

    !     in_string = in_t_split % input_string
    !     in_split_char = in_t_split % split_char
    !     in_string_len = in_t_split % input_length
    !     in_split_indices = in_t_split % split_indices
    !     in_range_lens = in_t_split % range_lens

    !     in_range_count = in_t_split % range_count

    !     index_start = 1
    !     current_range_len = 0
    !     in_range_count = 0

    !     DO i=1, in_string_len
    !         IF (i .EQ. in_split_indices(index_start)) THEN
    !             substring_range = in_string(index_start:i-1)

    !             in_ranges(index_start) = substring_range

    !             index_start = index_start + 1
    !             in_range_count = in_range_count + 1
                
    !         ELSE IF (i .EQ. in_string_len) THEN
    !             substring_range = in_string(index_start:i)

    !             in_ranges(index_start) = substring_range
                
    !             in_range_count = in_range_count + 1
    !         END IF
    !     END DO

    !     DO i=1, in_range_count
    !         current_range_len = LEN(in_ranges(i:i))
    !         in_range_lens(i) = current_range_len
    !     END DO

    !     ALLOCATE(CHARACTER(in_string_len) :: in_ranges(in_range_count))
    !     ALLOCATE(in_range_lens(in_range_count))

    !     in_t_split % ranges = in_ranges
    !     in_t_split % range_count = in_range_count
    !     in_t_split % range_lens = in_range_lens
    ! END SUBROUTINE populate_ranges

END MODULE mod_string_funcs