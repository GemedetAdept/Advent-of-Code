! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_05
    USE mod_parse, ONLY: get_file_len
    IMPLICIT NONE

    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=:), ALLOCATABLE :: buffer, range_buffer, id_buffer
    CHARACTER(LEN=:), DIMENSION(:,:), ALLOCATABLE :: ranges, ids
    INTEGER :: file_len, ios, max_id_len, max_range_len

    max_id_len = 15
    max_range_len = 1+(max_id_len * 2)

    ALLOCATE(CHARACTER(LEN=max_range_len) :: range_buffer)
    ALLOCATE(CHARACTER(LEN=max_id_len) :: id_buffer)
    ALLOCATE(CHARACTER(LEN=max_range_len) :: buffer)


    filename = "day_05_input.txt"
    file_len = get_file_len(filename)
    WRITE(*,*) file_len

END PROGRAM day_05