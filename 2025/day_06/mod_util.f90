MODULE mod_util
    IMPLICIT NONE
    PUBLIC :: is_numeral, is_space
CONTAINS
    FUNCTION is_numeral(in_char) RESULT(out_bool)
        CHARACTER(LEN=1) :: in_char
        LOGICAL :: out_bool

        IF (ICHAR(in_char) >= ICHAR("0") .AND. ICHAR(in_char) <= ICHAR("9")) THEN
            out_bool = .TRUE.
            RETURN
        ELSE
            out_bool = .FALSE.
            RETURN
        END IF
    END FUNCTION is_numeral

    FUNCTION is_space(in_char) RESULT(out_bool)
        CHARACTER(LEN=1) :: in_char
        LOGICAL :: out_bool

        IF (in_char == " ") THEN
            out_bool = .TRUE.
            RETURN
        ELSE
            out_bool = .FALSE.
            RETURN
        END IF
    END FUNCTION is_space
END MODULE mod_util