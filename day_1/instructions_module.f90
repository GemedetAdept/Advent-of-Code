MODULE instructions_module
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: Instructions, string_to_int, fill_directions

    TYPE Instructions
        CHARACTER, DIMENSION(:,:), ALLOCATABLE :: directions
        INTEGER, DIMENSION(:,:), ALLOCATABLE :: magnitudes
    END TYPE Instructions

CONTAINS

    INTEGER FUNCTION string_to_int(to_parse) RESULT(parsed_int)
        IMPLICIT NONE
        CHARACTER(LEN=*), INTENT(IN) :: to_parse

        READ(to_parse, "(I10)") parsed_int
    END FUNCTION string_to_int

    FUNCTION fill_directions(file_in, file_length) RESULT(directions_out)
        IMPLICIT NONE
        CHARACTER(LEN=*), INTENT(IN) :: file_in
        INTEGER, INTENT(IN) :: file_length
        CHARACTER, DIMENSION(file_length) :: directions_out
        INTEGER :: i

        OPEN(1, FILE=file_in, STATUS="OLD", ACTION="READ")
            DO i=1, file_length
                READ(1,*) directions_out(i)
            END DO
        CLOSE(1)
    END FUNCTION fill_directions

END MODULE instructions_module