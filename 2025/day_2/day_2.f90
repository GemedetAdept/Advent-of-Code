! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_range, ONLY: t_range, get_count, alloc_ids_count
    USE mod_string_funcs, ONLY: get_max_string_len, get_string_count
    IMPLICIT NONE

    ! <-- SETUP --> 
    INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: in_ranges
    CHARACTER(LEN=1) :: split
    INTEGER :: len_longest_range
    INTEGER :: range_count

    in_ranges = "11-22,95-115,998-1012"
    split = ","

    len_longest_range = get_max_string_len(in_ranges, split)
    WRITE(*,"(I0)") len_longest_range

    range_count = get_string_count(in_ranges, split)
    WRITE(*,"(I0)") range_count


END PROGRAM day_2