MODULE mod_instructions
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: string_to_int, int_to_string, get_int_len, get_int_first_half, get_int_last_half, &
        len_is_even, id_is_valid

CONTAINS

    FUNCTION string_to_int(in_string) RESULT(out_int)
        CHARACTER(LEN=:), ALLOCATABLE, INTENT(IN) :: in_string
        INTEGER :: out_int

        READ(in_string, *) out_int

    END FUNCTION string_to_int

    FUNCTION int_to_string(in_int) RESULT(out_string)
        INTEGER, INTENT(IN) :: in_int
        CHARACTER(LEN=:), ALLOCATABLE :: out_string

        ! Note: Fortran is *not* happy when the string doesn't have a defined length for this operation
        ALLOCATE(CHARACTER(LEN=50) :: out_string)

        WRITE(out_string, *) in_int
        out_string = ADJUSTL(out_string)
    END FUNCTION int_to_string

    ! I found this neat and elegant way of getting the length of a number using the common logarithm
    !   from FadedCoder in this StackOverflow thread: https://stackoverflow.com/questions/2189800/how-to-find-length-of-digits-in-an-integer
    ! I'm sure there are plenty of other sources and uses of it, but I like to give credit specifically to where I find things
    FUNCTION get_int_len(in_int) RESULT(out_len)
        INTEGER(KIND=8), INTENT(IN) :: in_int
        REAL :: calc_step
        INTEGER :: out_len

        calc_step = REAL(in_int)
        calc_step = LOG10(calc_step)

        out_len = FLOOR(calc_step)+1
    END FUNCTION get_int_len

    ! I found this solution by Ehsan Sajjad at this link:
    ! https://www.c-sharpcorner.com/blogs/how-to-get-first-n-digits-of-a-number
    FUNCTION get_int_first_half(in_int) RESULT(first_half)
        INTEGER(KIND=8), INTENT(IN) :: in_int
        INTEGER :: int_len, half_len
        INTEGER(KIND=8) :: first_half
        REAL :: calc_step
        
        int_len = get_int_len(in_int)
        half_len = int_len / 2
        
        calc_step = REAL(in_int)
        calc_step = AINT(calc_step/(10**(half_len)))

        first_half = INT(calc_step)

    END FUNCTION get_int_first_half

    FUNCTION get_int_last_half(in_int) RESULT(last_half)
        INTEGER(KIND=8), INTENT(IN) :: in_int
        INTEGER(KIND=8) :: int_len, half_len
        INTEGER(KIND=8) :: last_half

        int_len = get_int_len(in_int)
        half_len = int_len / 2
        
        last_half = MOD(in_int, 10**(half_len))

    END FUNCTION get_int_last_half

    FUNCTION len_is_even(in_int) RESULT(parity_bool)
        INTEGER(KIND=8), INTENT(IN) :: in_int
        INTEGER :: int_len
        LOGICAL :: parity_bool

        int_len = get_int_len(in_int)
        IF (MOD(int_len, 2) .EQ. 0) THEN
            parity_bool = .TRUE.
        ELSE
            parity_bool = .FALSE.
        END IF
    END FUNCTION len_is_even

    FUNCTION id_is_valid(in_int) RESULT(parity_bool)
        INTEGER(KIND=8), INTENT(IN) :: in_int
        INTEGER(KIND=8) :: first_half, last_half
        LOGICAL :: is_even
        LOGICAL :: parity_bool

        is_even = len_is_even(in_int)
        IF (is_even .EQV. .FALSE.) THEN
            parity_bool = .FALSE.
            RETURN
        END IF
        
        first_half = get_int_first_half(in_int)
        last_half = get_int_last_half(in_int)

        IF (first_half .EQ. last_half) THEN
            parity_bool = .FALSE.
        ELSE
            parity_bool = .TRUE.
        END IF

    END FUNCTION id_is_valid
END MODULE mod_instructions