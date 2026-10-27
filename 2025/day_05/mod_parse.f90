MODULE mod_parse
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: get_file_len

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
END MODULE