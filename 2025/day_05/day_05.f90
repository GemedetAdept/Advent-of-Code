! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_05
    USE mod_parse, ONLY: get_file_len
    IMPLICIT NONE
    INTEGER, PARAMETER :: I32 = selected_int_kind(32)

    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=:), ALLOCATABLE :: buffer, range_buffer
    CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: input
    INTEGER(KIND=I32), DIMENSION(:), ALLOCATABLE :: ids
    INTEGER(KIND=I32), DIMENSION(:,:), ALLOCATABLE :: range_pairs
    INTEGER(KIND=I32), DIMENSION(1,2) :: tmp_pair
    INTEGER(KIND=I32) :: range_lo, range_hi, tmp, tmp_lo, tmp_hi
    INTEGER(KIND=I32) :: output
    INTEGER :: range_count, range_size, tmp_size, overlap
    INTEGER :: i, j, k, ios
    INTEGER :: file_len, id_count
    INTEGER :: max_id_len, max_range_len
    LOGICAL :: is_valid

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
    WRITE(*,*) "Total IDs within range: ", output

! Part II
    output = 0

    ! Ensuring that pairs have the lower bound come first
    DO i=1, range_count
        IF (range_pairs(i,1) > range_pairs(i,2)) THEN
            tmp = range_pairs(i,1)
            range_pairs(i,1) = range_pairs(i,2)
            range_pairs(i,2) = tmp
        END IF
    END DO

    ! Sorting range pairs by lower bound from least to greatest
    DO i=1, range_count
        IF (i == 1) CYCLE

        DO j=1, range_count
            IF (j >= i) CYCLE

            IF (range_pairs(i,1) < range_pairs(j,1)) THEN
                tmp_pair(1,:) = range_pairs(i,:)
                range_pairs(i,:) = range_pairs(j,:)
                range_pairs(j,:) = tmp_pair(1,:)
            END IF
        END DO
    END DO

    DO i=1, range_count
        WRITE(*,*) i, range_pairs(i,1), range_pairs(i,2)
    END DO

    WRITE(*,*) output
END PROGRAM day_05