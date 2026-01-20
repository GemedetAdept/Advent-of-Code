MODULE mod_password
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_password, increment_count, calc_final_val, print_final_val

    TYPE t_password
        INTEGER :: inital_val
        INTEGER :: final_val
        INTEGER :: count
    END TYPE t_password

CONTAINS

    SUBROUTINE increment_count(password_in)
        IMPLICIT NONE

        TYPE(t_password) :: password_in
        INTEGER :: count_in

        count_in = password_in % count
        password_in % count = count_in + 1

        RETURN
    END SUBROUTINE increment_count
    
    SUBROUTINE calc_final_val(password_in)
        IMPLICIT NONE

        TYPE(t_password) :: password_in
        INTEGER :: final_val_out

        final_val_out = password_in%count + password_in%inital_val
        password_in%final_val = final_val_out

        RETURN
    END SUBROUTINE calc_final_val

    SUBROUTINE print_final_val(password_in)
        IMPLICIT NONE

        TYPE(t_password) :: password_in
        INTEGER :: final_val_out
        CHARACTER(LEN=*), PARAMETER :: leading_msg = "Resulting password: "

        final_val_out = password_in%final_val

        WRITE(*,"(A20, I0)") leading_msg, final_val_out

        RETURN
    END SUBROUTINE print_final_val

END MODULE mod_password