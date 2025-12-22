! Memento mori, ut memento vivere

PROGRAM day_1
    USE mod_instructions, ONLY : instruc_from_file, extract_directions, extract_magnitudes, &
        t_instructions
    USE mod_dial, ONLY : t_dial, delta_pos, check_pos
    USE mod_password, ONLY : t_password, increment_count, calc_final_val, print_final_val
    IMPLICIT NONE

    ! <-- SETUP -->
    INTEGER :: i

    CHARACTER(LEN=*), PARAMETER :: file = "day_1_input.txt"
    INTEGER, PARAMETER :: file_len = 4498
    INTEGER, PARAMETER :: instruc_len = 4
    INTEGER, PARAMETER :: direction_len = 1

    CHARACTER(LEN=instruc_len), DIMENSION(file_len) :: instructions
    CHARACTER(LEN=direction_len), DIMENSION(file_len) :: directions
    INTEGER, DIMENSION(file_len) :: magnitudes

    TYPE(t_dial) :: dial_1
    TYPE(t_instructions) :: instructions_1
    TYPE(t_password) :: password_1

    CHARACTER(LEN=direction_len) :: direction_val
    INTEGER :: magnitude_val
    LOGICAL :: pos_is_zero

    ! Testing Runtime
    REAL :: start, finish
    CALL CPU_TIME(start)

    instructions = instruc_from_file(file, file_len, instruc_len)
    directions   = extract_directions(instructions, file_len, direction_len)
    magnitudes   = extract_magnitudes(instructions, file_len)

    dial_1 = t_dial(pos=50, min=0, max=100)
    instructions_1 = t_instructions(file, instructions, directions, magnitudes)
    password_1 = t_password(0, 0, 0)

    ! <-- EXECUTION -->
    DO i=1, SIZE(instructions_1 % instructions)
        direction_val = directions(i)
        magnitude_val = magnitudes(i)

        dial_1%pos = delta_pos(dial_1, direction_val, magnitude_val)
        pos_is_zero = check_pos(dial_1%pos)

        IF (pos_is_zero .EQV. .TRUE.) THEN
            CALL increment_count(password_1)
        END IF
    END DO

    PRINT "('File length = ', I4, ' lines.')", file_len

    CALL CPU_TIME(finish)
    PRINT '("Time = ", F6.3, " seconds.")', finish - start

    CALL calc_final_val(password_1)
    CALL print_final_val(password_1)

END PROGRAM day_1