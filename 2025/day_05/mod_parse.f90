MODULE mod_parse
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: get_file_len, get_range_count

CONTAINS
    FUNCTION get_file_len(filename) RESULT(out_file_len)
        CHARACTER(LEN=:), ALLOCATABLE :: filename
        INTEGER :: out_file_len
        INTEGER :: ios = 0

        out_file_len = 0
        OPEN(unit=1, file=filename)
            DO WHILE(ios == 0)
                READ(1, '(A)', iostat=ios)
                out_file_len = out_file_len + 1
            END DO
        CLOSE(1)
    END FUNCTION get_file_len

    FUNCTION get_range_count(filename) RESULT (out_range_count)
        CHARACTER(LEN=:), ALLOCATABLE :: filename
        CHARACTER(LEN=1) :: buffer
        INTEGER :: i, out_range_count
        INTEGER :: ios = 0

        OPEN(unit=1, file=filename)

            i = 1
            DO WHILE(ios == 0)
                READ(1, '(A)', iostat=ios) buffer
                IF (buffer == "") THEN
                    out_range_count = i-1
                    RETURN
                END IF
                i = i+1
            END DO            
        CLOSE(1)
    END FUNCTION get_range_count
END MODULE