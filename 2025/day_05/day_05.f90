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
    DO i=1, range_count
        IF (range_pairs(i, 1) > range_pairs(i, 2)) THEN
            tmp = range_pairs(i,1)
            range_pairs(i,1) = range_pairs(i,2)
            range_pairs(i,2) = tmp
        END IF

        range_lo = range_pairs(i,1)
        range_hi = range_pairs(i,2)
        range_size = range_hi - range_lo + 1
        range_size = ABS(range_size)
        
        IF (i == 1) THEN
            output = output + range_size
            CYCLE
        END IF

        DO j=1, range_count
            IF (j >= i) CYCLE

            tmp_lo = range_pairs(j, 1)
            tmp_hi = range_pairs(j, 2)
            tmp_size = tmp_hi - tmp_lo + 1
            tmp_size = ABS(tmp_size)

            IF (range_lo == tmp_lo .AND. range_hi == tmp_hi) THEN
                overlap = range_size
            ! No overlap, target above
            ELSE IF (range_lo < tmp_lo .AND. range_lo < tmp_hi .AND. range_hi < tmp_lo .AND. range_hi < tmp_hi) THEN
                overlap = 0
            ! No overlap, target below
            ELSE IF (range_lo > tmp_lo .AND. range_lo > tmp_hi .AND. range_hi > tmp_lo .AND. range_hi > tmp_hi) THEN
                overlap = 0
            ! Overlap, target above
            ELSE IF (range_lo <= tmp_lo .AND. range_lo < tmp_hi .AND. range_hi >= tmp_lo .AND. range_hi <= tmp_hi) THEN
                overlap = range_hi-tmp_lo + 1
            ! Overlap, target below
            ELSE IF (range_lo >= tmp_lo .AND. range_lo <= tmp_hi .AND. range_hi > tmp_lo .AND. range_hi >= tmp_hi) THEN
                overlap = tmp_hi-range_lo + 1
            ! Current range inside target range
            ELSE IF (range_lo > tmp_lo .AND. range_hi < tmp_hi) THEN
                overlap = range_size
            ! Target range inside current range
            ELSE IF (range_lo < tmp_lo .AND. range_hi > tmp_hi) THEN
                overlap = tmp_size
            END IF

            range_size = range_size - ABS(overlap)
        END DO

        IF (range_size <= 0) CYCLE
        output = output + range_size
    END DO

    WRITE(*,*) output
END PROGRAM day_05