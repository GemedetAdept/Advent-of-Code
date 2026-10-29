MODULE mod_sort
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: insertion_sort, sort_pairs
CONTAINS
    SUBROUTINE insertion_sort(in_array, sort_col)
        INTEGER, PARAMETER :: I32 = selected_int_kind(32)
        INTEGER(KIND=I32), DIMENSION(:,:):: in_array
        INTEGER(KIND=I32), DIMENSION(1,2):: tmp
        INTEGER :: sort_col, i, j, arr_size

        arr_size = SIZE(in_array, 1)

        DO i=1, arr_size
            IF (i == 1) CYCLE
        DO j=1, arr_size
            IF (j >= i) CYCLE

            IF (in_array(i,sort_col) < in_array(j,sort_col)) THEN
                tmp(1,:) = in_array(i,:)
                in_array(i,:) = in_array(j,:)
                in_array(j,:) = tmp(1,:)
            END IF
        END DO
        END DO    
    END SUBROUTINE insertion_sort

    SUBROUTINE sort_pairs(in_array)
        INTEGER, PARAMETER :: I32 = selected_int_kind(32)
        INTEGER(KIND=I32), DIMENSION(:,:):: in_array
        INTEGER(KIND=I32):: tmp
        INTEGER ::i, j, arr_size

        arr_size = SIZE(in_array, 1)

        DO i=1, arr_size
            IF (in_array(i,1) > in_array(i,2)) THEN
                tmp = in_array(i,1)
                in_array(i,1) = in_array(i,2)
                in_array(i,2) = tmp
            END IF
        END DO
    END SUBROUTINE sort_pairs
END MODULE mod_sort