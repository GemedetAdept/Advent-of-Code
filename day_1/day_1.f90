PROGRAM day_1
    USE mod_instructions, ONLY : extract_instructions, extract_directions
    IMPLICIT NONE

    INTEGER :: i

    CHARACTER(LEN=*), PARAMETER :: file = "day_1_practice_input.txt"
    INTEGER, PARAMETER :: file_len = 10
    INTEGER, PARAMETER :: instruction_len = 4
    INTEGER, PARAMETER :: direction_len = 1

    CHARACTER(LEN=instruction_len), DIMENSION(file_len) :: instructions
    CHARACTER(LEN=direction_len), DIMENSION(file_len) :: directions
    INTEGER, DIMENSION(file_len) :: magnitudes
    CHARACTER(LEN=instruction_len) :: instruction

    instructions = extract_instructions(file, file_len, instruction_len)

    directions = extract_directions(instructions, file_len, direction_len)

    DO i=1, file_len
        instruction = instructions(i)(2:)
        READ(instruction,"(I3)") magnitudes(i)
    END DO

    PRINT*, instructions(2)
    PRINT*, directions(2)
    PRINT*, magnitudes(2)

END PROGRAM day_1