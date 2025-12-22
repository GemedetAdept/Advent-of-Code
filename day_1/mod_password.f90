MODULE mod_password
IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_password

    TYPE t_password
        INTEGER :: inital_val
        INTEGER :: count
    END TYPE t_password

END MODULE mod_password