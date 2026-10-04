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

! https://stackoverflow.com/questions/58278488/how-to-read-a-text-file-containing-strings-into-an-array-in-fortran

    filename = "day_03_input.txt"
    OPEN(unit=1, FILE=filename)

    DO WHILE(i == 0)
        line_count = line_count + 1
        READ(1, *, iostat=i)
    END DO

    line_count = line_count - 1
    ! For a reason unbeknownst to me, removing this WRITE statement breaks the program
    WRITE(*,*) line_count
    ALLOCATE(puzzle_input(line_count))

    REWIND(1)
    DO i=1, line_count
        READ(1, "(A)") puzzle_input(i)
    END DO

    CLOSE(1)

    toj_2 = total_output_joltage(puzzle_input, 2)
    WRITE(*,*) toj_2

    toj_12 = total_output_joltage(puzzle_input, 12)
    WRITE(*,*) toj_12

END PROGRAM day_03