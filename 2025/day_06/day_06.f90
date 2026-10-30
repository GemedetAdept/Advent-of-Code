! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_06
    IMPLICIT NONE

    CHARACTER(LEN=:), ALLOCATABLE :: filename, buffer
    CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: input
    CHARACTER(LEN=1), DIMENSION(:), ALLOCATABLE :: input_op
    INTEGER, DIMENSION(:,:), ALLOCATABLE :: input_int
    CHARACTER(LEN=1), DIMENSION(:,:), ALLOCATABLE :: matrix
    INTEGER :: i, j, k, ios
    INTEGER :: file_len, matrix_height, matrix_width, col_count
    INTEGER :: tmp_int
    CHARACTER :: tmp_char

    matrix_height = 5
    
    filename = "day_06_input.txt"
    OPEN(1, FILE=filename)
        INQUIRE(1, SIZE=file_len)
    CLOSE(1)

    matrix_width = file_len/matrix_height
    ALLOCATE(CHARACTER(LEN=matrix_width) :: buffer)
    ALLOCATE(CHARACTER(LEN=matrix_width) :: input(matrix_height))
    ALLOCATE(matrix(matrix_width, matrix_height))

    ios = 0
    OPEN(2, FILE=filename)
        DO WHILE (ios == 0)
            READ(2, '(A)', IOSTAT=ios) input
        END DO
    CLOSE(2)

    buffer = ""
    DO i=1, matrix_height
        buffer = input(i)
    DO j=1, matrix_width
        matrix(j,i) = buffer(j:j)
    END DO
    END DO

    col_count = 1
    DO i=1, matrix_width
        IF (i == 1) CYCLE
        IF (matrix(i-1,1) == " " .AND. matrix(i,1) /= " ") col_count = col_count+1
    END DO

    WRITE(*,*) col_count
    ALLOCATE(input_int(col_count, matrix_height-1))
    ALLOCATE(input_op(col_count))
END PROGRAM day_06