MODULE mod_dial
IMPLICIT NONE
    PRIVATE
    PUBLIC :: dial_t

    TYPE dial_t
        INTEGER :: pos
        INTEGER :: min
        INTEGER :: max
    END TYPE dial_t

END MODULE mod_dial