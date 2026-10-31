MODULE mod_util
    IMPLICIT NONE
    PUBLIC :: is_numeral, is_space, is_operator, sum_i32, product_i32
CONTAINS
    FUNCTION is_numeral(in_char) RESULT(out_bool)
        CHARACTER(LEN=1) :: in_char
        LOGICAL :: out_bool

        IF (ICHAR(in_char) >= ICHAR("0") .AND. ICHAR(in_char) <= ICHAR("9")) THEN
            out_bool = .TRUE.
            RETURN
        ELSE
            out_bool = .FALSE.
            RETURN
        END IF
    END FUNCTION is_numeral

    FUNCTION is_space(in_char) RESULT(out_bool)
        CHARACTER(LEN=1) :: in_char
        LOGICAL :: out_bool

        IF (in_char == " ") THEN
            out_bool = .TRUE.
            RETURN
        ELSE
            out_bool = .FALSE.
            RETURN
        END IF
    END FUNCTION is_space

    FUNCTION is_operator(in_char) RESULT(out_bool)
        CHARACTER(LEN=1) :: in_char
        CHARACTER(LEN=1), DIMENSION(4), PARAMETER :: operators = ["+","-","*","/"]
        INTEGER :: i
        LOGICAL :: out_bool

        out_bool = .FALSE.
        DO i=1, SIZE(operators)
            IF (in_char == operators(i)) out_bool = .TRUE.
        END DO

        RETURN
    END FUNCTION is_operator

    FUNCTION sum_i32(in_arr) RESULT(out_sum)
        INTEGER, PARAMETER :: I32 = selected_int_kind(32)
        INTEGER(KIND=I32), DIMENSION(:), ALLOCATABLE :: in_arr
        INTEGER(KIND=I32) :: out_sum
        INTEGER :: i

        out_sum = 0
        DO i=1, SIZE(in_arr)
            out_sum = out_sum + in_arr(i)
        END DO

        RETURN
    END FUNCTION sum_i32

    FUNCTION product_i32(in_arr) RESULT(out_product)
        INTEGER, PARAMETER :: I32 = selected_int_kind(32)
        INTEGER(KIND=I32), DIMENSION(:), ALLOCATABLE :: in_arr
        INTEGER(KIND=I32) :: out_product
        INTEGER :: i

        DO i=1, SIZE(in_arr)
            IF (i == 1) THEN
                out_product = in_arr(i)
                CYCLE
            END IF

            out_product = out_product * in_arr(i)
        END DO

        RETURN
    END FUNCTION product_i32
END MODULE mod_util