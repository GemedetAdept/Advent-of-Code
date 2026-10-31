MODULE mod_parse
    IMPLICIT NONE
    PUBLIC :: file_to_2d, get_file_dim
CONTAINS
    FUNCTION file_to_2d(iou, filename) RESULT(out_arr)
        CHARACTER(LEN=:), ALLOCATABLE :: filename
        CHARACTER(LEN=:), ALLOCATABLE :: buffer
        CHARACTER(LEN=:), DIMENSION(:), ALLOCATABLE :: buffer_arr
        CHARACTER(LEN=1), DIMENSION(:,:), ALLOCATABLE :: out_arr
        INTEGER :: i, j, file_w, file_h, iou

        CALL get_file_dim(iou, filename, file_w, file_h)
        ALLOCATE(CHARACTER(LEN=file_w) :: buffer)
        ALLOCATE(CHARACTER(LEN=file_w) :: buffer_arr(file_h))
        ALLOCATE(out_arr(file_w, file_h))

        OPEN(UNIT=iou, FIlE=filename)
            DO i=1, file_h
                READ(iou, '(A)') buffer
                
                DO j=1, file_w
                    out_arr(j,i) = buffer(j:j)
                END DO
            END DO
        CLOSE(iou)

        RETURN
    END FUNCTION file_to_2d

    SUBROUTINE get_file_dim(iou, filename, file_w, file_h)
        CHARACTER(LEN=:), ALLOCATABLE :: filename
        INTEGER :: iou, ios, i, j
        INTEGER :: size, file_w, file_h

        ios = 0
        file_w = 0
        file_h = 0
        OPEN(UNIT=iou, FILE=filename, FORM="formatted")
            INQUIRE(iou, SIZE=size)

            DO
                READ(iou, *, IOSTAT=ios)
                IF (ios /= 0) EXIT

                file_h = file_h + 1
            END DO
        CLOSE(iou)

        file_w = (size / file_h)
    END SUBROUTINE get_file_dim
END MODULE mod_parse