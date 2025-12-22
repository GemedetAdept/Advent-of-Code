MODULE mod_password
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_password

    TYPE t_password
        INTEGER :: inital_val
        INTEGER :: final_val
        INTEGER :: count
    END TYPE t_password

CONTAINS

    SUBROUTINE increment_count(count_in)
        INTEGER :: count_in

        count_in = count_in + 1

        RETURN
    END SUBROUTINE

END MODULE mod_password