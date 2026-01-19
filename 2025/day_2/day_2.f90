! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_string_funcs, ONLY: t_split_string, init_split_string, & 
        get_string_len, get_split_count, get_range_count, get_range_len, get_split_indices, get_ranges
    USE mod_range, ONLY: t_range, init_range, &
        get_id_bounds, get_id_count, populate_ids
    USE mod_instructions, ONLY: string_to_int, int_to_string, get_int_len, get_int_first_half
    USE mod_fileio, ONLY: read_file_oneline
    IMPLICIT NONE

    INTEGER(KIND=8) :: in_int, first_half

    in_int = 3945309285_8
    first_half = get_int_first_half(in_int)
    WRITE(*,*) first_half
    

    ! Set up variables

    ! Load file data (instructions) into variable as a singular string

    ! Split instructions string into array of string ranges

    ! Pass each range into a range object and load into an array of range objects

    ! Process ranges using procedures within the objects to get an array of all the ID values of the range

    ! Sum the total number of IDs (number provided by previous step) and use it to allocate
    !   space to an integer array, where the full list of IDs will be stored

    ! Initalize integer variable to hold the solution to the puzzle.

    ! Check every ID for validity. If the ID is invalid, add it to the solution integer.

    ! Per the puzzle on the Advent of Code website, this sum is the answer to the puzzle.

END PROGRAM day_2