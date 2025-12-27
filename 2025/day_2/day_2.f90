! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_range, ONLY: t_range, get_count, alloc_ids_count
    USE mod_string_funcs, ONLY: get_max_string_len, get_string_count, get_alloc_array, split_string
    IMPLICIT NONE

    ! <-- SETUP --> 
    INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: in_ranges
    CHARACTER(LEN=1) :: split
    INTEGER :: len_longest_range
    INTEGER :: range_count

    CHARACTER(:), ALLOCATABLE :: split_ranges(:)

    in_ranges = "11-22,95-115,998-1012"
    split = ","

    len_longest_range = get_max_string_len(in_ranges, split)
    WRITE(*,"(I0)") len_longest_range

    range_count = get_string_count(in_ranges, split)
    WRITE(*,"(I0)") range_count

    split_ranges = get_alloc_array(len_longest_range, range_count)
    WRITE(*,"(I0)") SIZE(split_ranges)

    split_ranges = split_string(in_ranges, split)

END PROGRAM day_2