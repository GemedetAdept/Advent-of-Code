MODULE mod_moore
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: moore_rolls_check

CONTAINS
    FUNCTION moore_rolls_check(puzzle_input) RESULT (output)
        IMPLICIT NONE

        CHARACTER(LEN=1), DIMENSION(:,:) :: puzzle_input
        INTEGER :: matrix_height, matrix_width
        INTEGER :: rolls_max, rolls_count, output

        INTEGER :: i, j, m, n, x, y
        CHARACTER :: char_roll

        char_roll = "@"
        rolls_max = 3
        matrix_height = SIZE(puzzle_input, 1)
        matrix_width = SIZE(puzzle_input, 2)

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
                    output = output + 1
                END IF
            END IF
        END DO
        END DO
    END FUNCTION moore_rolls_check
END MODULE mod_moore