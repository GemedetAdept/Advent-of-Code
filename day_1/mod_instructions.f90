MODULE mod_instructions
IMPLICIT NONE
    PRIVATE
    INTEGER :: i
    PUBLIC extract_instructions, extract_directions

CONTAINS

    FUNCTION extract_instructions(in_file, in_file_len, in_instruction_len) result(out_instructions)
        IMPLICIT NONE

        CHARACTER(LEN=*) :: in_file
        INTEGER :: in_file_len
        INTEGER :: in_instruction_len
        CHARACTER(LEN=in_instruction_len), DIMENSION(in_file_len) :: out_instructions

        OPEN(1, FILE=in_file, STATUS="OLD", ACTION="READ")
            DO i=1, in_file_len
                READ(1,*) out_instructions(i)
            END DO
        CLOSE(1)
    END FUNCTION extract_instructions

    FUNCTION extract_directions(in_instructions, in_file_len, in_direction_len) result(out_directions)
        IMPLICIT NONE
        INTEGER :: i

        CHARACTER(LEN=*) :: in_instructions(*)
        CHARACTER(LEN=4) :: in_instruction
        INTEGER :: in_direction_len
        INTEGER :: in_file_len

        CHARACTER(LEN=in_direction_len), DIMENSION(in_file_len) :: out_directions

        DO i=1, in_file_len
            in_instruction = in_instructions(i)
            out_directions(i) = in_instruction(1:1)
        END DO
    END FUNCTION extract_directions

END MODULE