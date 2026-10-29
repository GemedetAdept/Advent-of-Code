MODULE mod_merge
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: merge_range_arr
CONTAINS
    SUBROUTINE merge_range_arr(in_arr)
        INTEGER, PARAMETER :: I32 = selected_int_kind(32)
        INTEGER(KIND=I32), DIMENSION(:,:), ALLOCATABLE :: in_arr
        INTEGER(KIND=I32) :: range_lo, range_hi, tmp_lo, tmp_hi, min_id, max_id
        INTEGER :: i, j, arr_size

        arr_size = SIZE(in_arr, 1)

        DO i=1, arr_size
            IF (i == 1) CYCLE
        DO j=1, arr_size
            IF (j >= i) CYCLE

            range_lo = in_arr(i,1)
            range_hi = in_arr(i,2)
            tmp_lo = in_arr(j,1)
            tmp_hi = in_arr(j,2)

            min_id = MIN(range_lo, tmp_lo)
            max_id = MAX(range_hi, tmp_hi)
            
            IF (min_id == 0) CYCLE
            IF (tmp_hi >= range_lo-1) THEN
                in_arr(i,:) = [min_id, max_id]
                in_arr(j,:) = [0,0]
            END IF 
        END DO
        END DO
    END SUBROUTINE merge_range_arr
END MODULE mod_merge