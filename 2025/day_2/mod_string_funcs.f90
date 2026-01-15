MODULE mod_string_funcs
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_split_string

    TYPE t_split_string
        CHARACTER(LEN=:), ALLOCATABLE :: input_string
        CHARACTER(LEN=1) :: split_char

        INTEGER, ALLOCATABLE :: split_indices(:)
        INTEGER, ALLOCATABLE :: range_lens(:)
        INTEGER :: range_count
        INTEGER :: max_range_len

        CHARACTER(LEN=:), ALLOCATABLE :: ranges(:)
    END TYPE t_split_string

CONTAINS


END MODULE mod_string_funcs