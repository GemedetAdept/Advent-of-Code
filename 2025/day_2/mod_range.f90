MODULE mod_range
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_range, init_range, &
        get_bounding_ids, get_id_count, populate_ids

    TYPE t_range
        CHARACTER(LEN=:), ALLOCATABLE :: range_str
        CHARACTER(LEN=1) :: range_split
        INTEGER :: range_len = 0

        INTEGER :: id_start = 0
        INTEGER :: id_end = 0
        INTEGER :: id_count = 0

        INTEGER, ALLOCATABLE :: range_ids(:)
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

        CALL get_bounding_ids(out_t_range)
        CALL get_id_count(out_t_range)
        CALL populate_ids(out_t_range)
    END FUNCTION init_range

    SUBROUTINE get_bounding_ids(in_t_range)
        INTEGER :: i

        TYPE(t_range) :: in_t_range
        CHARACTER(LEN=:), ALLOCATABLE :: in_range_str
        CHARACTER(LEN=1) :: in_range_split
        INTEGER :: in_range_len

        INTEGER :: index_start = 1
        CHARACTER(LEN=:), ALLOCATABLE :: sub_range
        INTEGER :: out_id_start, out_id_end

        in_range_str = in_t_range % range_str
        in_range_split = in_t_range % range_split
        in_range_len = in_t_range % range_len

        out_id_start = in_t_range % id_start
        out_id_end = in_t_range % id_end

    END SUBROUTINE get_bounding_ids

    SUBROUTINE get_id_count(in_t_range)
        TYPE(t_range) :: in_t_range

        INTEGER :: id_start, id_end
        INTEGER :: id_count

        id_start = in_t_range % id_start
        id_end = in_t_range % id_end

        id_count = (id_start - id_end) + 1

        in_t_range % id_count = id_count
    END SUBROUTINE get_id_count

    SUBROUTINE populate_ids(in_t_range)
        INTEGER :: i

        TYPE(t_range) :: in_t_range
        INTEGER :: id_start, id_end, id_count
        INTEGER :: id_iter
        INTEGER, ALLOCATABLE :: range_ids(:)

        id_start = in_t_range % id_start
        id_end = in_t_range % id_end
        id_count = in_t_range % id_count

        ALLOCATE(range_ids(id_count))

        id_iter = id_start
        DO i = 1, id_count
            range_ids(i) = id_iter
            id_iter = id_iter + 1
        END DO

        in_t_range % range_ids = range_ids
    END SUBROUTINE populate_ids

END MODULE mod_range