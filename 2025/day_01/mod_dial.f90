MODULE mod_dial
USE mod_instructions, ONLY: t_instructions
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: t_dial, delta_pos, check_pos

    TYPE t_dial
        INTEGER :: pos
        INTEGER :: min
        INTEGER :: max
    END TYPE t_dial

CONTAINS

    FUNCTION delta_pos(dial_in, direction, magnitude) RESULT(pos_out)
        IMPLICIT NONE

        TYPE(t_dial) :: dial_in
        CHARACTER(LEN=1) :: direction
        INTEGER :: magnitude
        INTEGER :: pos_val
        INTEGER :: max_val
        INTEGER :: pos_out

        pos_val = dial_in % pos
        max_val = dial_in % max

        IF (direction .EQ. "L") THEN 
            magnitude = -magnitude
        END IF

        pos_val = pos_val + magnitude
        pos_out = MOD(pos_val, max_val)

    END FUNCTION delta_pos

    FUNCTION check_pos(pos) RESULT(is_zero)
        IMPLICIT NONE

        INTEGER :: pos
        LOGICAL :: is_zero

        is_zero = .FALSE.

        IF (pos .EQ. 0) THEN
            is_zero = .TRUE.
        END IF

    END FUNCTION check_pos

END MODULE mod_dial