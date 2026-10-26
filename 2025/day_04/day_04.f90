! Memento mori, ut memento vivere
! github.com/GemedetAdept

! Notes:
!   There is likely a more elegant way of solving this, but I opted for checking the Moore Neighborhood of a cell

PROGRAM day_04
    IMPLICIT NONE

    INTEGER, PARAMETER :: matrix_width = 137
    INTEGER, PARAMETER :: matrix_height = 137
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=1) :: puzzle_input(matrix_width, matrix_height)
    CHARACTER(LEN=matrix_width) :: buffer

    INTEGER :: output
    INTEGER :: i, j, m, n, x, y
    INTEGER :: rolls_max, rolls_count
    CHARACTER(LEN=1) :: char_roll, char_space

    char_roll = "@"
    char_space = "."
    rolls_max = 3

    filename = "day_04_input.txt"
    OPEN(unit=1, FILE=filename)
        DO i=1, matrix_height
            READ(1, "(A)") buffer

            DO j=1, matrix_width
                puzzle_input(i, j) = buffer(j:j)
            END DO
        END DO
    CLOSE(1)
    
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

    WRITE(*,*) "Total accessible rolls: ", output

END PROGRAM day_04