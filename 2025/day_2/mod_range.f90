MODULE mod_range
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_range, init_range, &
        get_id_bounds, get_id_count, populate_ids
    TYPE t_range
        CHARACTER(LEN=:), ALLOCATABLE :: range_str
        CHARACTER(LEN=1) :: range_split
        INTEGER :: range_len = 0

        INTEGER(KIND=8) :: id_start = 0
        INTEGER(KIND=8) :: id_end = 0
        INTEGER(KIND=8) :: id_count = 0

        INTEGER(KIND=8), ALLOCATABLE :: range_ids(:)
    END TYPE t_range

CONTAINS

    FUNCTION init_range(string, split) RESULT(out_t_range)
        CHARACTER(LEN=:), ALLOCATABLE, INTENT(IN) :: string
        CHARACTER(LEN=1), INTENT(IN) :: split
        TYPE(t_range) :: out_t_range

        CHARACTER(LEN=:), ALLOCATABLE :: trim_string
        INTEGER :: range_len
        
        trim_string = TRIM(ADJUSTL(string))
        range_len = LEN(trim_string)

        out_t_range = t_range(trim_string, split, range_len)

        CALL get_id_bounds(out_t_range)
        CALL get_id_count(out_t_range)
        CALL populate_ids(out_t_range)
    END FUNCTION init_range

    SUBROUTINE get_id_bounds(in_t_range)
        TYPE(t_range) :: in_t_range

        INTEGER :: i, in_range_len
        INTEGER(KIND=8) :: id_start, id_end
        INTEGER :: id_start_i, id_end_i

        CHARACTER(LEN=:), ALLOCATABLE :: id_start_substr
        CHARACTER(LEN=:), ALLOCATABLE :: id_end_substr
        INTEGER :: id_start_len, id_end_len

        CHARACTER(LEN=:), ALLOCATABLE :: in_range_str
        CHARACTER(LEN=1) :: in_range_split

        in_range_str = in_t_range % range_str
        in_range_split = in_t_range % range_split
        in_range_len = in_t_range % range_len

        id_start_i = 1
        id_end_i = in_range_len

        DO i=1, in_range_len
            IF (in_range_str(i:i) .EQ. in_range_split) THEN

                id_start_len = i-1
                id_start_substr = in_range_str(id_start_i : i-1)
                READ (id_start_substr, *) id_start

                id_end_len = in_range_len - i
                id_end_substr = in_range_str(i+1 : id_end_i)
                READ (id_end_substr, *) id_end
            END IF
        END DO

        in_t_range % id_start = id_start
        in_t_range % id_end = id_end
    END SUBROUTINE get_id_bounds

    SUBROUTINE get_id_count(in_t_range)
        TYPE(t_range) :: in_t_range
        INTEGER(KIND=8) :: in_id_start, in_id_end, in_id_count

        in_id_start = in_t_range % id_start
        in_id_end = in_t_range % id_end
        in_id_count = in_id_end - in_id_start

        in_t_range % id_count = in_id_count
    END SUBROUTINE get_id_count

    SUBROUTINE populate_ids(in_t_range)
        TYPE(t_range) :: in_t_range
        INTEGER(KIND=8) :: i, id_iter
        INTEGER(KIND=8) :: in_id_start, in_id_count
        INTEGER(KIND=8), ALLOCATABLE :: in_range_ids(:)

        in_id_start = in_t_range % id_start
        in_id_count = (in_t_range % id_count) + 1

        ALLOCATE(in_range_ids(in_id_count))

        id_iter = in_id_start
        DO i=1, in_id_count
            in_range_ids(i) = id_iter
            id_iter = id_iter + 1
        END DO

        in_t_range % range_ids = in_range_ids
    END SUBROUTINE populate_ids

END MODULE mod_range