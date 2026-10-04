! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_04
    IMPLICIT NONE

    INTEGER, PARAMETER :: matrix_width = 137
    INTEGER, PARAMETER :: matrix_height = 137
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=1) :: puzzle_input(matrix_width, matrix_height)
    CHARACTER(LEN=matrix_width) :: buffer

    INTEGER :: i, j

    filename = "day_04_input.txt"
    OPEN(unit=1, FILE=filename)

    DO i=1, matrix_height
        READ(1, "(A)") buffer

        DO j=1, matrix_width
            puzzle_input(i, j) = buffer(j:j)
        END DO
    END DO

    CLOSE(1)
END PROGRAM day_04