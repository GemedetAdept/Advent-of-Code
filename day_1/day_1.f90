PROGRAM day_1
    IMPLICIT NONE

    INTEGER :: i

    INTEGER, PARAMETER :: file_length = 10
    INTEGER, PARAMETER :: instruction_length = 4
    INTEGER, PARAMETER :: direction_length = 1

    CHARACTER(LEN=instruction_length), DIMENSION(file_length) :: instructions
    CHARACTER(LEN=direction_length), DIMENSION(file_length) :: directions
    INTEGER, DIMENSION(file_length) :: magnitudes

    CHARACTER(LEN=*), PARAMETER :: file = "day_1_practice_input.txt"

    OPEN(2, FILE=file, STATUS="OLD", ACTION="READ")
        DO i=1, file_length
            READ(2,*) instructions(i)
        END DO
    CLOSE(2)

    PRINT*, instructions(3)

END PROGRAM day_1