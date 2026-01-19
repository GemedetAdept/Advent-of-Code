MODULE mod_instructions
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: string_to_int

CONTAINS

    FUNCTION string_to_int(in_string) RESULT(out_int)
        CHARACTER(LEN=:), ALLOCATABLE, INTENT(IN) :: in_string
        INTEGER :: out_int

        READ(in_string, *) out_int

    END FUNCTION string_to_int
END MODULE mod_instructions