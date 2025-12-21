MODULE instructions_module
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: Instructions

    TYPE Instructions
        CHARACTER, DIMENSION(:,:), ALLOCATABLE :: directions
        INTEGER, DIMENSION(:,:), ALLOCATABLE :: magnitudes
    END TYPE Instructions

CONTAINS

    FUNCTION string_to_int(to_parse)
        CHARACTER(LEN=*), INTENT(IN) :: to_parse
        INTEGER, INTENT(OUT) :: parsed_int

        READ(to_parse, "(I10)") parsed_int
    END FUNCTION string_to_int