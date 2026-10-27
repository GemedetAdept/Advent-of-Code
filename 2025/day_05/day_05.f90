! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_05
    USE mod_parse, ONLY: get_file_len, get_range_count
    IMPLICIT NONE

    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=:), ALLOCATABLE :: buffer, range_buffer, id_buffer
    ! CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: input
    ! CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: ranges, ids
    ! INTEGER :: i, ios
    INTEGER :: file_len, range_count, id_count
    INTEGER :: max_id_len, max_range_len

    max_id_len = 15
    max_range_len = 1+(max_id_len * 2)

    filename = "day_05_input.txt"
    file_len = get_file_len(filename)
    range_count = get_range_count(filename)
    id_count = file_len - (1 + range_count)

    ALLOCATE(CHARACTER(LEN=max_range_len) :: buffer)


END PROGRAM day_05