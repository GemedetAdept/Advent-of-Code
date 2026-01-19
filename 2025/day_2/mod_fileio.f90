MODULE mod_fileio
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: read_file_oneline
CONTAINS

    FUNCTION read_file_oneline(file_unit, filename) RESULT(buffer)
        INTEGER, INTENT(IN) :: file_unit
        CHARACTER(LEN=:), ALLOCATABLE, INTENT(IN) :: filename
        CHARACTER(LEN=:), ALLOCATABLE :: buffer

        LOGICAL :: file_exists
        INTEGER :: file_size

        INQUIRE(FILE=filename, EXIST=file_exists)
        INQUIRE(FILE=filename, SIZE=file_size)

        ALLOCATE(CHARACTER(LEN=file_size) :: buffer)

        IF (file_exists .EQV. .TRUE.) THEN
            OPEN(file_unit, FILE=filename, STATUS="OLD", ACTION="READ")
            READ(file_unit, "(A)") buffer
            CLOSE(file_unit, STATUS="KEEP")
        END IF

        buffer = TRIM(buffer)

    END FUNCTION read_file_oneline

END MODULE mod_fileio