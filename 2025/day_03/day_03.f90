! Memento mori, ut memento vivere
! github.com/GemedetAdept

PROGRAM day_03
    IMPLICIT NONE

    INTEGER, PARAMETER :: bank_len = 100
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=bank_len), ALLOCATABLE :: puzzle_input(:)
    INTEGER :: line_count = 0
    INTEGER, DIMENSION(bank_len) :: current_bank

    INTEGER :: jolt_val
    INTEGER :: tens_value, tens_index, ones_value, ones_index
    INTEGER :: bank_output

    INTEGER :: i, j
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

    ! Total Output Joltage
    DO i=1, line_count

        ! Tens value
        tens_value = 0
        tens_index = 0
        DO j=1, bank_len-1
            READ(puzzle_input(i)(j:j), "(I3)") jolt_val
            current_bank(j) = jolt_val

            IF (jolt_val > tens_value) THEN
                tens_value = jolt_val
                tens_index = j
            END IF
        END DO

        ! Ones value
        ones_value = 0
        ones_index = 0
        DO j=tens_index+1, bank_len
            READ(puzzle_input(i)(j:j), "(I3)") jolt_val
            current_bank(j) = jolt_val

            IF (jolt_val > ones_value) THEN
                ones_value = jolt_val
                ones_index = j
            END IF
        END DO

        bank_output = (tens_value*10) + ones_value
        PRINT "(I3, ' > ', I2)", i, bank_output
        total_joltage = total_joltage + bank_output
    END DO

    PRINT "('Total Output Joltage =', I8)", total_joltage

! Part II

END PROGRAM day_03