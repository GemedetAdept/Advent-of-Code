! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_range, ONLY: t_range, get_count, alloc_ids_count
    USE mod_string_funcs, ONLY: get_max_string_len
    IMPLICIT NONE

    ! <-- SETUP --> 
    INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: in_ranges
    CHARACTER(LEN=1) :: split
    INTEGER :: len_longest_range

    in_ranges = "11-22,95-115,998-1012"
    split = ","

    len_longest_range = get_max_string_len(in_ranges, split)
    WRITE(*,*) len_longest_range


END PROGRAM day_2