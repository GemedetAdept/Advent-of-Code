MODULE mod_instructions
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: string_to_int, get_int_len

CONTAINS

    FUNCTION string_to_int(in_string) RESULT(out_int)
        CHARACTER(LEN=:), ALLOCATABLE, INTENT(IN) :: in_string
        INTEGER :: out_int

        READ(in_string, *) out_int

    END FUNCTION string_to_int

    ! I found this neat and elegant way of getting the length of a number using the common logarithm
    !   from FadedCoder in this StackOverflow thread: https://stackoverflow.com/questions/2189800/how-to-find-length-of-digits-in-an-integer
    ! I'm sure there are plenty of other sources and uses of it, but I like to give credit specifically to where I find things
    FUNCTION get_int_len(in_int) RESULT(out_len)
        INTEGER, INTENT(IN) :: in_int
        REAL :: in_real, calc_step
        INTEGER :: out_len

        in_real = REAL(in_int)
        calc_step = LOG10(in_real)

        out_len = FLOOR(calc_step)+1
    END FUNCTION get_int_len
END MODULE mod_instructions