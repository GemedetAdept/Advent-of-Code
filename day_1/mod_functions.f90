MODULE mod_functions
IMPLICIT NONE
    PRIVATE
    PUBLIC extract_instructions

CONTAINS

    FUNCTION extract_instructions(in_file, in_file_len, in_instruction_len) result(out_instructions)
        IMPLICIT NONE
        INTEGER :: i

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

END MODULE