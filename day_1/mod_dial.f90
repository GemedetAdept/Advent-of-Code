MODULE mod_dial
IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_dial

    TYPE t_dial
        INTEGER :: pos
        INTEGER :: min
        INTEGER :: max
    END TYPE t_dial


END MODULE mod_dial