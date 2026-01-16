! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_range, ONLY: t_range
    USE mod_string_funcs, ONLY: t_split_string, init_split_string, get_split_count
    IMPLICIT NONE

    ! <-- SETUP --> 
    INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: input_string
    INTEGER :: input_string_len
    CHARACTER(LEN=1) :: split_char
    TYPE(t_split_string), ALLOCATABLE :: new_split_string

    input_string = "11-22,95-115,998-1012"
    input_string_len = LEN(input_string)
    split_char = ","

    new_split_string = t_split_string(input_string, split_char)
    call init_split_string(new_split_string)
    call get_split_count(new_split_string)

    WRITE(*,*) new_split_string % input_string
    WRITE(*,*) new_split_string % split_char
    WRITE(*,*) new_split_string % input_length
    WRITE(*,*) SIZE(new_split_string % split_indices)

END PROGRAM day_2