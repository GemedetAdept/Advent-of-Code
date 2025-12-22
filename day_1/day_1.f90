! Memento mori, ut memento vivere

PROGRAM day_1
    USE mod_instructions, ONLY : instruc_from_file, extract_directions, extract_magnitudes, &
        t_instructions
    USE mod_dial, ONLY : t_dial, delta_pos
    IMPLICIT NONE

    INTEGER :: i

    CHARACTER(LEN=*), PARAMETER :: file = "day_1_practice_input.txt"
    INTEGER, PARAMETER :: file_len = 10
    INTEGER, PARAMETER :: instruc_len = 4
    INTEGER, PARAMETER :: direction_len = 1

    CHARACTER(LEN=instruc_len), DIMENSION(file_len) :: instrucs
    CHARACTER(LEN=direction_len), DIMENSION(file_len) :: directions
    INTEGER, DIMENSION(file_len) :: magnitudes

    TYPE(t_dial) :: dial
    TYPE(t_instructions) :: instructions_1

    dial = t_dial(pos=50, min=0, max=99)

    instrucs = instruc_from_file(file, file_len, instruc_len)
    directions   = extract_directions(instrucs, file_len, direction_len)
    magnitudes   = extract_magnitudes(instrucs, file_len)

    instructions_1 = t_instructions(file, instrucs, directions, magnitudes)

END PROGRAM day_1