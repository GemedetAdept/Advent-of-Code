! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_03
    IMPLICIT NONE

    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=100), ALLOCATABLE :: puzzle_input(:)
    INTEGER :: in_line_count = 0
    INTEGER, DIMENSION(100) :: current_bank

    INTEGER :: tens_value, tens_index, ones_value, ones_index
    INTEGER :: bank_output

    INTEGER :: i = 0
    INTEGER(KIND=8) :: total_joltage

    filename = "day_03_input.txt"
    OPEN(unit=1, FILE=filename)

! https://stackoverflow.com/questions/58278488/how-to-read-a-text-file-containing-strings-into-an-array-in-fortran

    DO WHILE(i == 0)
        in_line_count = in_line_count + 1
        READ(1, *, iostat=i)
    END DO
    in_line_count = in_line_count - 1
    ALLOCATE(puzzle_input(in_line_count))

    REWIND(1)
    
    DO i = 1, in_line_count
        READ(1, "(A)") puzzle_input(i)
    END DO
    CLOSE(1)



END PROGRAM day_03