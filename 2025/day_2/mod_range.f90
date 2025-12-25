MODULE range
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_range

    TYPE t_range
        INTEGER :: range_start
        INTEGER :: range_end
        INTEGER, DIMENSION(:), ALLOCATABLE :: ranges
    END TYPE t_range
END MODULE range