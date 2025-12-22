MODULE mod_instructions
IMPLICIT NONE
    INTEGER :: i
    PRIVATE
    PUBLIC :: extract_instructions, extract_directions, extract_magnitudes

CONTAINS

    FUNCTION extract_instructions(in_file, in_in_file_len, in_instruction_len) RESULT(out_instructions)
        IMPLICIT NONE

        CHARACTER(LEN=*) :: in_file
        INTEGER :: in_in_file_len
        INTEGER :: in_instruction_len
        CHARACTER(LEN=in_instruction_len), DIMENSION(in_in_file_len) :: out_instructions

        OPEN(1, FILE=in_file, STATUS="OLD", ACTION="READ")
            DO i=1, in_in_file_len
                READ(1,*) out_instructions(i)
            END DO
        CLOSE(1)
    END FUNCTION extract_instructions

    FUNCTION extract_directions(in_instructions, in_file_len, in_direction_len) RESULT(out_directions)
        IMPLICIT NONE

        CHARACTER(LEN=*) :: in_instructions(*)
        CHARACTER :: in_instruction
        INTEGER :: in_direction_len
        INTEGER :: in_file_len

        CHARACTER(LEN=in_direction_len), DIMENSION(in_file_len) :: out_directions

        DO i=1, in_file_len
            in_instruction = in_instructions(i)
            out_directions(i) = in_instruction(1:1)
        END DO
    END FUNCTION extract_directions

    FUNCTION extract_magnitudes(in_instructions, in_file_len) RESULT(out_magnitudes)
        IMPLICIT NONE

        CHARACTER(LEN=*) :: in_instructions(*)
        CHARACTER :: in_instruction
        INTEGER :: in_file_len

        INTEGER, DIMENSION(in_file_len) :: out_magnitudes

        DO i=1, in_file_len
            in_instruction = in_instructions(i)
            in_instruction = in_instruction(2:)
            READ(in_instruction, "(I3)") out_magnitudes(i)
        END DO
    END FUNCTION extract_magnitudes

END MODULE