MODULE mod_instructions
IMPLICIT NONE
    INTEGER :: i
    PRIVATE
    PUBLIC :: instruc_from_file, extract_directions, extract_magnitudes, t_instructions

    TYPE t_instructions
        CHARACTER(LEN=:), ALLOCATABLE :: file
        INTEGER :: file_len
        INTEGER :: instruc_len
        INTEGER :: direction_len

        CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: instructions
        CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: directions
        INTEGER, DIMENSION(:), ALLOCATABLE :: magnitudes
        CHARACTER(LEN=:), ALLOCATABLE :: instruction
    END TYPE t_instructions

CONTAINS

    FUNCTION instruc_from_file(in_file, in_file_len, in_instruction_len) RESULT(out_instructions)
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
    END FUNCTION instruc_from_file

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
        CHARACTER(LEN=4) :: in_instruction
        INTEGER :: in_file_len

        INTEGER, DIMENSION(in_file_len) :: out_magnitudes

        DO i=1, in_file_len
            in_instruction = in_instructions(i)
            in_instruction = in_instruction(2:)
            READ(in_instruction, "(I3)") out_magnitudes(i)
        END DO
    END FUNCTION extract_magnitudes

END MODULE