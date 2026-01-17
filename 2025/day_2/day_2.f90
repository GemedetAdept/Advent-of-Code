! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_string_funcs, ONLY: t_split_string, init_split_string, get_split_count, get_range_count, get_range_len, get_split_indices, get_ranges
    USE mod_range, ONLY: t_range, get_bounding_ids, get_id_count, populate_ids
    IMPLICIT NONE

    ! <-- SETUP --> 
    ! INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: input_string
    INTEGER :: input_string_len
    CHARACTER(LEN=1) :: split_char
    TYPE(t_split_string), ALLOCATABLE :: new_split

    CHARACTER(:), ALLOCATABLE :: input_range
    INTEGER :: range_len
    CHARACTER(LEN=1) :: range_split
    TYPE(t_range) :: new_range

    input_string = "11-22,95-115,998-1012"
    input_string_len = LEN(input_string)
    split_char = ","

    new_split = t_split_string(input_string, split_char)
    CALL init_split_string(new_split)
    CALL get_split_count(new_split)
    CALL get_range_count(new_split)
    CALL get_split_indices(new_split)
    CALL get_range_len(new_split)
    CALL get_ranges(new_split)

    ! WRITE(*,*) new_split % input_string
    ! WRITE(*,*) new_split % split_char
    ! WRITE(*,*) new_split % input_length
    ! WRITE(*,*) SIZE(new_split % split_indices)
    ! WRITE(*,*) new_split % range_count
    ! WRITE(*,*) new_split % split_indices
    ! WRITE(*,*) new_split % range_lens
    WRITE(*,*) new_split % ranges

    ! input_range = "998-1012"
    ! range_split = "-"
    ! range_len = LEN(input_range)

    ! new_range = t_range(input_range, range_split, range_len, 0,0,0)
    ! CALL get_bounding_ids(new_range)
    ! CALL get_id_count(new_range)
    ! CALL populate_ids(new_range)

    ! WRITE(*,"(A,I0)") "ID Start: ", new_range % id_start
    ! WRITE(*,"(A,I0)") "ID End:   ", new_range % id_end
    ! WRITE(*,"(A,I0)") "ID Count: ", new_range % id_count
    ! WRITE(*,"(I0)") new_range % range_ids

END PROGRAM day_2