! Memento mori, ut memento vivere
! github.com/GemedetAdept

! Notes:
!   There is likely a more elegant way of solving this, but I opted for checking the Moore Neighborhood of a cell

PROGRAM day_04
    USE mod_moore, ONLY: moore_rolls_check
    IMPLICIT NONE

    INTEGER, PARAMETER :: matrix_width = 137
    INTEGER, PARAMETER :: matrix_height = 137
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=1) :: puzzle_input(matrix_width, matrix_height)
    CHARACTER(LEN=matrix_width) :: buffer

    INTEGER :: output
    INTEGER :: i, j, m, n, x, y
    CHARACTER(LEN=8) :: moore_buffer
    INTEGER :: rolls_max, rolls_count
    CHARACTER(LEN=1) :: char_roll

    char_roll = "@"
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

    WRITE(*,*) "[Day 04, Part I]"

    output = 0
    output = moore_rolls_check(puzzle_input)
    WRITE(*,*) "Total accessible rolls: ", output

! Day 04, Part II


END PROGRAM day_04