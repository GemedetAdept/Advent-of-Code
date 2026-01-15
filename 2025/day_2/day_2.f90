! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_range, ONLY: t_range, get_count, alloc_ids_count
    USE mod_string_funcs, ONLY: t_split_string
    IMPLICIT NONE

    ! <-- SETUP --> 
    INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: in_ranges
    CHARACTER(LEN=1) :: split

    in_ranges = "95-115,998-1012"
    split = ","

END PROGRAM day_2