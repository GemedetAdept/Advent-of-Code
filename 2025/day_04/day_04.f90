! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_04
    IMPLICIT NONE

    INTEGER, PARAMETER :: matrix_width = 137
    INTEGER, PARAMETER :: matrix_height = 137
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=1) :: puzzle_input(matrix_width, matrix_height)
    CHARACTER(LEN=matrix_width) :: buffer

    INTEGER :: i, j, m, n, x, y
    INTEGER :: atsign_dec, period_dec
    INTEGER :: max_atsign
    INTEGER :: moore_max, moore_sum

    INTEGER :: output

    atsign_dec = ICHAR("@")
    period_dec = ICHAR(".")
    max_atsign = 3
    moore_max = (atsign_dec * max_atsign) + (period_dec * (8-max_atsign))

    WRITE(*,*) atsign_dec, period_dec, moore_max

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

        DO m=-1, 1
        DO n=-1, 1
            y = m+i
            x = n+j
            IF (y < 1 .OR. y > matrix_height .OR. x < 1 .OR. x > matrix_width) THEN
                moore_sum = moore_sum + period_dec
            ELSE IF (m == 0 .AND. n == 0) THEN
                moore_sum = moore_sum + 0
            ELSE IF (puzzle_input(y,x) == ".") THEN
                moore_sum = moore_sum + period_dec
            ELSE IF (puzzle_input(y,x) == "@") THEN
                moore_sum = moore_sum + atsign_dec
            END IF
        END DO
        END DO

            IF (moore_sum <= moore_max) THEN
                output = output + 1
            END IF

            ! WRITE(*,*) i, j, moore_sum
            moore_sum = 0
    END DO
    END DO

    WRITE(*,*) "Total accessible rolls: ", output

END PROGRAM day_04