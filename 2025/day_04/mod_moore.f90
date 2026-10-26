MODULE mod_moore
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: moore_check

CONTAINS
    FUNCTION moore_check(grid_in, pos_y, pos_x) RESULT (moore_arr)
        IMPLICIT NONE

        CHARACTER(LEN=1), INTENT(IN), DIMENSION(:,:) :: grid_in
        INTEGER, INTENT(IN) :: pos_y, pos_x

        INTEGER :: i, j, y, x, n
        INTEGER :: grid_h, grid_w
        CHARACTER(LEN=8) :: moore_arr

        grid_h = SIZE(grid_in, 1)
        grid_w = SIZE(grid_in, 2)

        n = 1
        DO i=-1, 1
        DO j=-1, 1
            y = pos_y+i
            x = pos_x+j
            
            IF (y <= 0 .OR. y > grid_h) THEN
                moore_arr(n:n) = "."
                CONTINUE
            ELSE IF (x <= 0 .OR. x > grid_w) THEN
                moore_arr(n:n) = "."
                CONTINUE
            ELSE IF (i == 0 .AND. j == 0) THEN
                CONTINUE
            ELSE
                moore_arr(n:n) = grid_in(y, x)
            END IF
            
            n = n+1
        END DO
        END DO
        
    END FUNCTION moore_check
END MODULE mod_moore