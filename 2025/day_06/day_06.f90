! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_06
    USE mod_util, ONLY: is_numeral
    IMPLICIT NONE

    CHARACTER(LEN=:), ALLOCATABLE :: filename, buffer
    CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: matrix
    CHARACTER(LEN=1), DIMENSION(:), ALLOCATABLE :: matrix_op
    INTEGER, DIMENSION(:,:), ALLOCATABLE :: matrix_int
    CHARACTER(LEN=1), DIMENSION(:,:), ALLOCATABLE :: input
    INTEGER :: i, j, k, ios
    INTEGER :: file_len, input_height, input_width, col_count
    INTEGER :: tmp_int
    CHARACTER :: tmp_char

    input_height = 5
    
    filename = "day_06_input.txt"
    OPEN(1, FILE=filename)
        INQUIRE(1, SIZE=file_len)
    CLOSE(1)

    input_width = file_len/input_height
    ALLOCATE(CHARACTER(LEN=input_width) :: buffer)
    ALLOCATE(CHARACTER(LEN=input_width) :: matrix(input_height))
    ALLOCATE(input(input_width, input_height))

    ios = 0
    OPEN(2, FILE=filename)
        DO WHILE (ios == 0)
            READ(2, '(A)', IOSTAT=ios) matrix
        END DO
    CLOSE(2)

    buffer = ""
    DO i=1, input_height
        buffer = matrix(i)
    DO j=1, input_width
        input(j,i) = buffer(j:j)
    END DO
    END DO

    col_count = 1
    DO i=1, input_width
        IF (i == 1) CYCLE

        IF (.NOT. is_numeral(input(i-1,1)) .AND. is_numeral(input(i,1))) THEN
             col_count = col_count+1
        END IF
    END DO

    WRITE(*,*) col_count
    ALLOCATE(matrix_int(col_count, input_height-1))
    ALLOCATE(matrix_op(col_count))

    tmp_int = 0
    buffer = ""
    DO i=1, input_height-1

    k=1
    DO j=1, input_width
        IF (k > col_count) CYCLE
        
        tmp_char = input(j,i)

        IF (is_numeral(tmp_char)) THEN
            buffer = buffer // tmp_char
        ELSE IF (.NOT. is_numeral(tmp_char) .AND. is_numeral(input(j-1,i))) THEN
            READ(buffer, "(I4)") tmp_int
            matrix_int(k, i) = tmp_int

            k = k+1
            buffer = ""
        ELSE
            CYCLE
        END IF
    END DO
    END DO

    WRITE(*,*) (matrix_int(:,i), i=1, SIZE(matrix_int, 2))
END PROGRAM day_06