! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_05
    USE mod_parse, ONLY: get_file_len
    IMPLICIT NONE
    INTEGER, PARAMETER :: I32 = selected_int_kind(32)

    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=:), ALLOCATABLE :: buffer, range_buffer, id_buffer
    CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: input, ranges
    INTEGER(KIND=I32), DIMENSION(:), ALLOCATABLE :: ids, valid_ids, tmp
    INTEGER(KIND=I32), DIMENSION(:,:), ALLOCATABLE :: range_pairs
    INTEGER :: i, j, k, ios
    INTEGER :: file_len, id_count
    INTEGER :: range_count, range_size, tmp_size
    INTEGER(KIND=I32) :: range_lo, range_hi, tmp_lo, tmp_hi, overlap
    INTEGER :: max_id_len, max_range_len, valid_ids_len
    INTEGER :: output
    LOGICAL :: is_valid, is_unique

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

    ALLOCATE(range_pairs(range_count, 2))
    DO i=1, range_count
        range_buffer = input(i)
        DO j=1, max_range_len
            IF (range_buffer(j:j) == "-") THEN
                READ(range_buffer(:j-1), "(I32)") range_pairs(i, 1)
                READ(range_buffer(j+1:), "(I32)") range_pairs(i, 2)
            END IF
        END DO
    END DO

    ALLOCATE(ids(id_count))
    DO i=1, id_count
        READ(input((range_count+1)+i), "(I32)") ids(i)
    END DO

    output = 0
    DO i=1, id_count
        is_valid = .FALSE.

        DO j=1, range_count
            IF (ids(i) >= range_pairs(j, 1) .AND. ids(i) <= range_pairs(j, 2)) THEN
                is_valid = .TRUE.
            END IF
        END DO

        IF (is_valid) output = output+1
    END DO

    WRITE(*,*) "[Day 05, Part I]"
    WRITE(*,*) "Total valid IDs: ", output

! Part II

    output = 0
    DO i=1, range_count
        range_lo = range_pairs(i, 1)
        range_hi = range_pairs(i, 2)

        range_size = (range_hi - range_lo) + 1

        IF (i == 1) THEN
            output = output + range_size
            CYCLE
        END IF

        DO j=1, range_count
            IF (j == i) EXIT

            tmp_lo = range_pairs(j, 1)
            tmp_hi = range_pairs(j, 2)
            tmp_size = (tmp_hi - tmp_lo) + 1

            overlap = (range_size + tmp_size) - (ABS(tmp_hi-range_lo) + ABS(tmp_lo-range_hi))
            WRITE(*,*) i, j, overlap
        END DO
    END DO
    

END PROGRAM day_05