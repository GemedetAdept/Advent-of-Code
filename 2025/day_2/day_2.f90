! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_range, ONLY: t_range, get_count, alloc_ids_count
    IMPLICIT NONE

    ! <-- SETUP --> 
    INTEGER :: i

    CHARACTER :: in_range = "11-22"
    INTEGER :: in_len = LEN(in_range)
    CHARACTER(:), ALLOCATABLE :: ranges_array(:)

    ALLOCATE(CHARACTER(in_len) :: ranges_array(2))

    ! <-- Create t_range objects from extracted string ranges -->
    DO i=1, in_len
        
    END DO


END PROGRAM day_2