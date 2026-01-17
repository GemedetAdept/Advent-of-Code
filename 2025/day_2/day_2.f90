! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_string_funcs, ONLY: t_split_string, init_split_string, & 
        get_string_len, get_split_count, get_range_count, get_range_len, get_split_indices, get_ranges
    USE mod_range, ONLY: t_range, &
        get_bounding_ids, get_id_count, populate_ids
    IMPLICIT NONE

    ! <-- SETUP --> 
    ! INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: input_string
    CHARACTER(LEN=1) :: split_char
    TYPE(t_split_string) :: new_split

    input_string = "11-22,95-115,998-1012"
    split_char = ","

    new_split = init_split_string(input_string, split_char)

    ! WRITE(*,*) new_split % input_string
    ! WRITE(*,*) new_split % split_char
    ! WRITE(*,*) new_split % input_length
    ! WRITE(*,*) SIZE(new_split % split_indices)
    ! WRITE(*,*) new_split % range_count
    ! WRITE(*,*) new_split % split_indices
    ! WRITE(*,*) new_split % range_lens
    WRITE(*,*) new_split % ranges

END PROGRAM day_2