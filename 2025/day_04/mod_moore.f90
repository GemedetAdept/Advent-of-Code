MODULE mod_moore
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: rolls_check

CONTAINS
    FUNCTION rolls_check(puzzle_input, char_roll, rolls_max) RESULT (output)
        IMPLICIT NONE

        CHARACTER(LEN=1), DIMENSION(:,:) :: puzzle_input
        CHARACTER(LEN=:), ALLOCATABLE :: buffer
        INTEGER :: matrix_height, matrix_width
        INTEGER :: rolls_max, rolls_count, output

        INTEGER :: i, j, m, n, x, y
        CHARACTER :: char_roll

        output = 0
        matrix_height = SIZE(puzzle_input, 1)
        matrix_width = SIZE(puzzle_input, 2)

        ALLOCATE(CHARACTER(LEN=matrix_width) :: buffer)
        OPEN(2, FILE="puzzle_state.txt", POSITION="append", ACTION="write")

        DO i=1, matrix_height
        DO j=1, matrix_width

            rolls_count = 0
            IF (puzzle_input(i, j) == char_roll) THEN
                DO m=-1, 1
                DO n=-1, 1
                    y = m+i
                    x = n+j
                    
                    IF (y <= 0 .OR. y > matrix_height) THEN
                        CONTINUE
                    ELSE IF (x <= 0 .OR. x > matrix_width) THEN
                        CONTINUE
                    ELSE IF (m == 0 .AND. n == 0) THEN
                        CONTINUE
                    ELSE
                        IF (puzzle_input(y, x) == char_roll) THEN
                            rolls_count = rolls_count + 1
                        END IF
                    END IF
                END DO
                END DO

                IF (rolls_count <= rolls_max) THEN
                    buffer(j:j) = "."
                    output = output + 1
                ELSE
                    buffer(j:j) = "@"
                END IF
            ELSE
                buffer(j:j) = "."
            END IF
        END DO
            WRITE(2,*) buffer
        END DO

        CLOSE(2)
    END FUNCTION rolls_check

    ! FUNCTION recur_rolls_check
    !     IMPLICIT NONE


    ! END FUNCTION recur_rolls_check
END MODULE mod_moore