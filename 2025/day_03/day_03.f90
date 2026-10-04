! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_03
    USE mod_joltage, ONLY: total_output_joltage
    IMPLICIT NONE

    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=100), ALLOCATABLE :: puzzle_input(:)
    INTEGER :: line_count = 0

    INTEGER :: i
    INTEGER(KIND=8) :: toj_2 = 0
    INTEGER(KIND=8) :: toj_12 = 0

    WRITE(*,*) "Advent of Code 2025, Day 3"

    filename = "day_03_input.txt"
    OPEN(unit=1, FILE=filename)

    DO WHILE(i == 0)
        line_count = line_count + 1
        READ(1, *, iostat=i)
    END DO

    line_count = line_count - 1
    ALLOCATE(puzzle_input(line_count))

    REWIND(1)
    DO i=1, line_count
        READ(1, "(A)") puzzle_input(i)
    END DO

    CLOSE(1)

    WRITE(*,*) "Total Output Joltage, Pick 2 : "
    toj_2 = total_output_joltage(puzzle_input, 2)
    WRITE(*,"(I8)") toj_2

    WRITE(*,*) "Total Output Joltage, Pick 12: "
    toj_12 = total_output_joltage(puzzle_input, 12)
    WRITE(*,"(I16)") toj_12

END PROGRAM day_03