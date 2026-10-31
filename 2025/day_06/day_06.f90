! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_06
    USE mod_util, ONLY: is_numeral, is_space, sum_i32, product_i32
    USE mod_parse, ONLY: file_to_2d, get_file_dim
    IMPLICIT NONE
    INTEGER, PARAMETER :: I32 = selected_int_kind(32)

    CHARACTER(LEN=:), ALLOCATABLE :: filename, buffer
    INTEGER(KIND=I32), DIMENSION(:), ALLOCATABLE :: int_buffer
    INTEGER(KIND=I32), DIMENSION(:,:), ALLOCATABLE :: matrix_int
    CHARACTER(LEN=1), DIMENSION(:), ALLOCATABLE :: matrix_ops
    INTEGER(KIND=I32), DIMENSION(:), ALLOCATABLE :: matrix_sums ! matrix_sums_and_products seemed a touch too long, though more accurate
    CHARACTER(LEN=1), DIMENSION(:,:), ALLOCATABLE :: input
    INTEGER :: i, j, k, ios
    INTEGER :: file_len, input_height, input_width, col_count
    INTEGER(KIND=I32) :: tmp_int, sum, output
    CHARACTER :: tmp_char, oper

    input_height = 5
    
    input_width = 0
    input_height = 0
    filename = "day_06_input.txt"
    CALL get_file_dim(1, filename, input_width, input_height)

    ALLOCATE(CHARACTER(LEN=input_width) :: buffer)
    ALLOCATE(input(input_width, input_height))

    input = file_to_2d(1, filename)

    col_count = 1
    DO i=1, input_width
        IF (i == 1) CYCLE

        IF (is_space(input(i-1,1)) .AND. is_numeral(input(i,1))) THEN
             col_count = col_count+1
        END IF
    END DO

    ALLOCATE(matrix_int(col_count, input_height-1))
    ALLOCATE(matrix_ops(col_count))
    ALLOCATE(matrix_sums(col_count))

    buffer = ""
    tmp_int = 0_i32
    DO i=1, input_height
         k=1
    DO j=1, input_width
        IF (k > col_count) CYCLE

        tmp_char = input(j,i)
        IF (is_numeral(tmp_char)) THEN
            buffer = buffer // tmp_char

        ELSE IF (is_space(tmp_char) .AND. is_numeral(input(j-1, i))) THEN
            READ(buffer, '(I32)') matrix_int(k, i)

            k = k+1
            buffer = ""
            CYCLE
        ELSE
            CYCLE
        END IF
    END DO
    END DO

    k=1
    DO i=1, input_width
        IF (k > col_count) EXIT
        tmp_char = input(i,input_height)

        IF (.NOT. is_space(tmp_char)) THEN
            matrix_ops(k) = tmp_char
            k = k+1
        END IF
    END DO

    oper = ""
    sum = 0_i32
    DO i=1, col_count
        oper = matrix_ops(i)
        DO j=1, input_height-1
            IF (j == 1) THEN
                sum = matrix_int(i,j)
                CYCLE
            END IF

            SELECT CASE(oper)
            CASE("+")
                sum = sum + matrix_int(i,j)
            CASE("*")
                IF (sum == 0) THEN 
                    sum = matrix_int(i,j)
                ELSE IF (sum /= 0) THEN
                    sum = sum * matrix_int(i,j)
                END IF
            END SELECT
        END DO

        matrix_sums(i) = sum
        sum = 0_i32
    END DO

    output = sum_i32(matrix_sums)

    PRINT "(A16)", "[Day 06, Part I]"
    PRINT "(A30, I64)", "Total sum of cephalopod math: ", output

    ! Day 06, Part II - Remedial Cephalopod Math

    PRINT "(A17)", "[Day 06, Part II]"
    PRINT "(A28, I32)", "Remediated cephalopod math: ", output

END PROGRAM day_06