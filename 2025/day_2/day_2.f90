! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_string_funcs, ONLY: t_split_string, init_split_string, get_split_count
    USE mod_range, ONLY: t_range, get_bounding_ids, get_id_count, populate_ids
    IMPLICIT NONE

    ! <-- SETUP --> 
    ! INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: input_string
    INTEGER :: input_string_len
    CHARACTER(LEN=1) :: split_char
    TYPE(t_split_string), ALLOCATABLE :: new_split_string

    CHARACTER(:), ALLOCATABLE :: input_range
    INTEGER :: range_len
    CHARACTER(LEN=1) :: range_split
    TYPE(t_range) :: new_range

    input_string = "11-22,95-115,998-1012"
    input_string_len = LEN(input_string)
    split_char = ","

    new_split_string = t_split_string(input_string, split_char)
    CALL init_split_string(new_split_string)
    CALL get_split_count(new_split_string)

    ! WRITE(*,*) new_split_string % input_string
    ! WRITE(*,*) new_split_string % split_char
    ! WRITE(*,*) new_split_string % input_length
    ! WRITE(*,*) SIZE(new_split_string % split_indices)

    input_range = "998-1012"
    range_split = "-"
    range_len = LEN(input_range)

    new_range = t_range(input_range, range_split, range_len, 0,0,0)

    CALL get_bounding_ids(new_range)
    WRITE(*,*) "ID Start: ", new_range % id_start
    WRITE(*,*) "ID End:   ", new_range % id_end

    CALL get_id_count(new_range)
    WRITE(*,*) "ID Count: ", new_range % id_count

    CALL populate_ids(new_range)
    WRITE(*,*) "IDs List: ", new_range % range_ids

END PROGRAM day_2