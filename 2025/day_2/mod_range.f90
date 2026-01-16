MODULE mod_range
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_range

    TYPE t_range(range_str, range_len)
        CHARACTER(*) :: range_str
        INTEGER :: range_len

        INTEGER :: id_start, id_end
        INTEGER :: id_count

        INTEGER, ALLOCATABLE :: range_ids(:)
    END TYPE t_range

CONTAINS

END MODULE mod_range