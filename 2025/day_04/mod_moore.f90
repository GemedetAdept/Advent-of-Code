MODULE mod_moore
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: rolls_check, recur_rolls_check

CONTAINS
    FUNCTION rolls_check(puzzle_input, char_roll, rolls_max) RESULT (output)
        IMPLICIT NONE

        CHARACTER(LEN=1), DIMENSION(:,:) :: puzzle_input
        INTEGER :: matrix_height, matrix_width
        INTEGER :: rolls_max, rolls_count, output

        INTEGER :: i, j, m, n, x, y
        CHARACTER :: char_roll

        output = 0
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
    END FUNCTION rolls_check

    RECURSIVE FUNCTION recur_rolls_check(puzzle_input, char_roll, rolls_max, rolls_total) RESULT (recur_output)
        IMPLICIT NONE

        CHARACTER(LEN=1), DIMENSION(:,:) :: puzzle_input
        CHARACTER(LEN=1), DIMENSION(:,:), ALLOCATABLE :: puzzle_state
        CHARACTER(LEN=:), ALLOCATABLE :: buffer
        INTEGER :: matrix_height, matrix_width
        INTEGER :: rolls_max, rolls_count, rolls_total, output, recur_output

        INTEGER :: i, j, m, n, x, y
        CHARACTER :: char_roll

        output = 0
        recur_output = rolls_total
        matrix_height = SIZE(puzzle_input, 1)
        matrix_width = SIZE(puzzle_input, 2)

        ALLOCATE(CHARACTER(LEN=matrix_width) :: buffer)
        ALLOCATE(puzzle_state(matrix_height, matrix_width))

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
            DO j=1, matrix_width
                puzzle_state(i, j) = buffer(j:j)
            END DO
        END DO

        IF (output == 0) THEN
            RETURN
        ELSE
            recur_output = recur_output + output
            recur_output = recur_rolls_check(puzzle_state, char_roll, rolls_max, recur_output)
        END IF
    END FUNCTION recur_rolls_check
END MODULE mod_moore