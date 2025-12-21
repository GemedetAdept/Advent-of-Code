PROGRAM day_1
    IMPLICIT NONE

    INTEGER :: i

    INTEGER, PARAMETER :: file_length = 10
    INTEGER, PARAMETER :: instruction_length = 4
    INTEGER, PARAMETER :: direction_length = 1

    CHARACTER(LEN=instruction_length), DIMENSION(file_length) :: instructions
    CHARACTER(LEN=direction_length), DIMENSION(file_length) :: directions
    INTEGER, DIMENSION(file_length) :: magnitudes
    CHARACTER(LEN=instruction_length) :: instruction

    CHARACTER(LEN=*), PARAMETER :: file = "day_1_practice_input.txt"

    OPEN(1, FILE=file, STATUS="OLD", ACTION="READ")
        DO i=1, file_length
            READ(1,*) instructions(i)
        END DO
    CLOSE(1)

    DO i=1, file_length
        instruction = instructions(i)
        directions(i) = instruction(1:1)
    END DO

    DO i=1, file_length
        instruction = instructions(i)(2:)
        READ(instruction,"(I3)") magnitudes(i)
    END DO

END PROGRAM day_1