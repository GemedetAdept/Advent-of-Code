MODULE mod_range
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_range, get_count, alloc_ids_count

    TYPE t_range
        INTEGER :: start
        INTEGER :: end
        INTEGER, ALLOCATABLE :: ids(:)
        INTEGER :: count
    END TYPE t_range

CONTAINS

    FUNCTION get_count(in_start, in_end) RESULT(out_count)
        IMPLICIT NONE

        INTEGER :: in_start, in_end, out_count

        out_count = (in_end - in_start) + 1
    END FUNCTION get_count

    SUBROUTINE alloc_ids_count(in_range)
        IMPLICIT NONE

        TYPE(t_range) :: in_range
        INTEGER :: in_count

        in_count = in_range % count
        ALLOCATE(in_range % ids(in_count))
        
        RETURN
    END SUBROUTINE alloc_ids_count
END MODULE mod_range