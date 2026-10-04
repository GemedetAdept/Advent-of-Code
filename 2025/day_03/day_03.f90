! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_03
    IMPLICIT NONE

    INTEGER, PARAMETER :: bank_len = 100
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=bank_len), ALLOCATABLE :: puzzle_input(:)
    INTEGER :: line_count = 0
    INTEGER, DIMENSION(bank_len) :: current_bank

    CHARACTER(LEN=1) :: battery_val, max_val
    INTEGER :: battery_index, max_index
    CHARACTER(LEN=:), ALLOCATABLE :: bank_out
    INTEGER(KIND=8) :: bank_val

    INTEGER :: i, j, k, start, end
    INTEGER :: battery_count
    INTEGER(KIND=8) :: total_joltage = 0

    filename = "day_03_input.txt"
    OPEN(unit=1, FILE=filename)

! https://stackoverflow.com/questions/58278488/how-to-read-a-text-file-containing-strings-into-an-array-in-fortran

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

! Part II
    battery_count = 12
    ALLOCATE(CHARACTER(LEN=battery_count) :: bank_out)

    DO i=1, line_count
        max_index = 0

        DO j=1, battery_count
            max_val = "0"

            DO k=max_index+1, bank_len-(battery_count-j)
                IF (puzzle_input(i)(k:k) > max_val) THEN
                    max_val = puzzle_input(i)(k:k)
                    max_index = k
                END IF
            END DO

            bank_out(j:j) = max_val

        END DO

        READ(bank_out, "(I8)") bank_val
        total_joltage = total_joltage + bank_val
    END DO

    WRITE(*,*) total_joltage

END PROGRAM day_03