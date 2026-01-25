! Memento mori, ut memento vivere

PROGRAM day_03
    IMPLICIT NONE

    INTEGER :: i, unit
    
    CHARACTER(LEN=:), ALLOCATABLE :: filename
    CHARACTER(LEN=:), ALLOCATABLE :: in_instructions

    filename = "day_03_input.txt"

    OPEN(UNIT=1, FILE=filename, STATUS="OLD", ACTION="READ")

END PROGRAM day_03