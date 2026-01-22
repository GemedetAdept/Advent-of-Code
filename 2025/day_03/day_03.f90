! Memento mori, ut memento vivere

PROGRAM day_03
    USE mod_fileio, ONLY: file_readto_oneline
    IMPLICIT NONE

    INTEGER :: i, unit
    
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=:), ALLOCATABLE :: in_instruct

    OPEN(UNIT=1, FILE=filename, STATUS="OLD", ACTION="READ")


END PROGRAM day_03