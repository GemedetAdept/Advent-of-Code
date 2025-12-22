MODULE mod_dial
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_dial, delta_pos

    TYPE t_dial
        INTEGER :: pos
        INTEGER :: min
        INTEGER :: max
    END TYPE t_dial

CONTAINS

    FUNCTION delta_pos(pos, direction, magnitude) RESULT(pos_out)
        IMPLICIT NONE

        INTEGER :: pos
        INTEGER :: pos_out
        INTEGER :: max
        CHARACTER(LEN=1) :: direction
        INTEGER :: magnitude

        IF (direction .EQ. "L") THEN 
            magnitude = -magnitude
        END IF

        pos = pos + magnitude
        pos_out = MOD(pos, max)

    END FUNCTION delta_pos


END MODULE mod_dial