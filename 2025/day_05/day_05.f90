! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_05
    USE mod_parse, ONLY: get_file_len
    IMPLICIT NONE

    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=:), ALLOCATABLE :: buffer, range_buffer, id_buffer
    CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: input, ranges, ids
    INTEGER :: i, j, ios
    INTEGER :: file_len, range_count, id_count
    INTEGER :: max_id_len, max_range_len

    max_id_len = 15
    max_range_len = 1+(max_id_len * 2)

    filename = "day_05_input.txt"
    file_len = get_file_len(filename)

    ALLOCATE(CHARACTER(LEN=max_range_len) :: input(file_len))
    OPEN(unit=1, file=filename)
        DO i=1, file_len
            READ(1, "(A)") input(i)
        END DO
    CLOSE(1)

    DO i=1, file_len
        buffer = input(i)
        IF (buffer(1:1) == " ") THEN
            range_count = i-1
            id_count = file_len-i
        END IF
    END DO

    ALLOCATE(CHARACTER(LEN=max_range_len) :: ranges(range_count))
    DO i=1, range_count
        ranges(i) = input(i)
    END DO

    ALLOCATE(CHARACTER(LEN=max_range_len) :: ids(id_count))
    DO i=1, id_count
        ids(i) = input((range_count+1)+i)
    END DO

END PROGRAM day_05