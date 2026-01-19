! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_string_funcs, ONLY: t_split_string, init_split_string, & 
        get_string_len, get_split_count, get_range_count, get_range_len, get_split_indices, get_ranges
    USE mod_range, ONLY: t_range, init_range, &
        get_id_bounds, get_id_count, populate_ids
    USE mod_instructions, ONLY: string_to_int, int_to_string, get_int_len, get_int_first_half, get_int_last_half, &
        len_is_even, id_is_valid
    USE mod_fileio, ONLY: read_file_oneline
    IMPLICIT NONE

    INTEGER(KIND=8) :: i, j
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=:), ALLOCATABLE :: puzzle_input
    CHARACTER(LEN=1) :: split_comma, split_dash

    TYPE(t_split_string) :: split_input
    INTEGER :: range_count
    TYPE(t_range), ALLOCATABLE :: t_ranges(:)
    TYPE(t_range) :: temp_range
    CHARACTER(LEN=:), ALLOCATABLE :: str_ranges(:)
    CHARACTER(LEN=:), ALLOCATABLE :: temp_range_str
    
    INTEGER(KIND=8) :: id_count, temp_id_count
    LOGICAL :: is_valid
    INTEGER(KIND=8) :: temp_id
    INTEGER(KIND=16) :: invalid_id_sum
    INTEGER(KIND=8), ALLOCATABLE :: temp_ids(:)

    filename = "day_2_input.txt"
    puzzle_input = read_file_oneline(1, filename)
    ! WRITE(*,*) puzzle_input

    split_comma = ","
    split_dash = "-"
    split_input = init_split_string(puzzle_input, split_comma)
    str_ranges = split_input % ranges
    range_count = split_input % range_count

    ALLOCATE(t_ranges(range_count))
    DO i=1, range_count
        temp_range_str = str_ranges(i)
        temp_range = init_range(temp_range_str, split_dash)
        t_ranges(i) = temp_range
    END DO

    id_count = 0
    DO i=1, range_count
        id_count = id_count + t_ranges(i) % id_count
    END DO

    invalid_id_sum = 0
    DO i=1, range_count
        temp_range = t_ranges(i)
        temp_id_count = temp_range % id_count
        ALLOCATE(temp_ids(temp_id_count))

        temp_ids = temp_range % range_ids
        DO j=1, temp_id_count
            temp_id = temp_ids(j)
            is_valid = id_is_valid(temp_id)

            IF (is_valid .EQV. .FALSE.) THEN
                invalid_id_sum = invalid_id_sum + temp_id
            END IF
        END DO

        DEALLOCATE(temp_ids)
    END DO

    PRINT '("Sum of Invalid IDs = ", I0)', invalid_id_sum

END PROGRAM day_2