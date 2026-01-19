! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_string_funcs, ONLY: t_split_string, init_split_string, & 
        get_string_len, get_split_count, get_range_count, get_range_len, get_split_indices, get_ranges
    USE mod_range, ONLY: t_range, init_range, &
        get_id_bounds, get_id_count, populate_ids
    USE mod_instructions, ONLY: t_instructions, init_instructions
    USE mod_fileio, ONLY: read_file_oneline
    IMPLICIT NONE

    ! <-- SETUP --> 
    ! INTEGER :: i

    ! TYPE(t_split_string) :: instruc_split
    ! CHARACTER(LEN=:), ALLOCATABLE :: input_string
    ! CHARACTER(LEN=1) :: split_char

    ! TYPE(t_range) :: new_range
    ! CHARACTER(LEN=:), ALLOCATABLE :: input_range
    ! CHARACTER(LEN=1) :: range_split

    ! input_string = "11-22,95-115,998-1012"
    ! split_char = ","
    ! instruc_split = init_split_string(input_string, split_char)

    ! input_range = instruc_split % ranges(1)
    ! range_split = "-"
    ! new_range = init_range(input_range, range_split)

END PROGRAM day_2