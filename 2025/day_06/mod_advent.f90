MODULE mod_advent
    USE mod_util, ONLY: is_space, is_numeral, is_operator
    IMPLICIT NONE
    PUBLIC :: get_col_count, to_columns_i32, strip_spaces

    ! Module for Advent of Code-specific functions and subroutines
CONTAINS
    FUNCTION to_columns_i32(in_arr, col_count) RESULT(out_arr)
        INTEGER, PARAMETER :: I32 = selected_int_kind(32)
        CHARACTER(LEN=1), DIMENSION(:,:), ALLOCATABLE :: in_arr
        INTEGER(KIND=I32), DIMENSION(:,:), ALLOCATABLE :: out_arr
        CHARACTER(LEN=:), ALLOCATABLE :: buffer
        CHARACTER(LEN=:), ALLOCATABLE :: tmp_char
        INTEGER :: i, j, k, arr_w, arr_h, col_count

        arr_w = SIZE(in_arr, 1)
        arr_h = SIZE(in_arr, 2)

        ALLOCATE(out_arr(col_count, arr_h))

        buffer = ""
        DO i=1, arr_h
            k=1
        DO j=1, arr_w
            IF (k > col_count) CYCLE

            tmp_char = in_arr(j,i)
            IF (is_numeral(tmp_char)) THEN
                buffer = buffer // tmp_char

            ELSE IF (is_space(tmp_char) .AND. is_numeral(in_arr(j-1, i))) THEN
                READ(buffer, '(I32)') out_arr(k, i)

                k = k+1
                buffer = ""
                CYCLE
            END IF
        END DO
        END DO

        RETURN
    END FUNCTION to_columns_i32

    FUNCTION get_col_count(in_arr) RESULT(out_int)
        CHARACTER(LEN=1), DIMENSION(:,:), ALLOCATABLE :: in_arr
        CHARACTER(LEN=1) :: tmp_char
        INTEGER :: i, out_int

        out_int = 1
        DO i=1, SIZE(in_arr,1)
            tmp_char = in_arr(i,1)
            IF (is_numeral(tmp_char) .AND. is_space(in_arr(i-1,1))) out_int = out_int + 1
        END DO

        RETURN
    END FUNCTION get_col_count

    FUNCTION strip_spaces(in_arr) RESULT(out_arr)
        CHARACTER(LEN=1), DIMENSION(:), ALLOCATABLE :: in_arr, out_arr
        CHARACTER(LEN=1) :: tmp_char
        INTEGER :: i, j, elem_count

        tmp_char = ""
        DO i=1, SIZE(in_arr)
            tmp_char = in_arr(i)
            IF (is_space(tmp_char)) CYCLE
            IF (.NOT. is_space(tmp_char)) THEN
                DO j=i, 1, -1
                    IF (j == i) CYCLE
                    IF (is_space(in_arr(j))) CYCLE
                    IF (is_operator(in_arr(j))) THEN
                        IF (is_space(in_arr(j+1))) THEN
                            in_arr(j+1) = tmp_char
                            in_arr(i) = " "
                        END IF
                    END IF
                END DO
            END IF
        END DO

        elem_count = 0
        DO i=1, SIZE(in_arr)
            IF (.NOT. is_space(in_arr(i))) elem_count = elem_count + 1
        END DO

        ALLOCATE(out_arr(elem_count))
        out_arr(:) = in_arr(:elem_count)
    
        RETURN
    END FUNCTION strip_spaces
END MODULE mod_advent