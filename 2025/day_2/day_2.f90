! Memento mori, ut memento vivere

PROGRAM day_2
    USE mod_range, ONLY: t_range, get_count, alloc_ids_count
    IMPLICIT NONE

    ! <-- SETUP --> 
    INTEGER :: i

    CHARACTER(:), ALLOCATABLE :: input_ranges
    CHARACTER(:), ALLOCATABLE :: ranges_array(:)

    INTEGER :: input_len
    ! range_count is set to one to account for a lack of a comma at the very end
    INTEGER :: range_count = 1
    ! also need to determine the max length of ranges to allocate to ranges_array
    INTEGER :: curr_range_len = 0
    INTEGER :: max_range_len = 0
    INTEGER :: array_start = 1

    TYPE(t_range) :: range_1

    range_1 = t_range(start=11, end=22, count=0)
    range_1%count = get_count(range_1%start, range_1%end)
    WRITE(*,"(I0)") range_1%count
    CALL alloc_ids_count(range_1)
    WRITE(*,"(I0)") SIZE(range_1%ids)

    input_ranges = "11-22,95-115,998-1012"
    input_len = LEN(input_ranges)

    DO i=1, input_len
        IF (input_ranges(i:i) .EQ. ",") THEN
            range_count = range_count + 1

            curr_range_len = i - array_start
            array_start = i + 1
        END IF

        ! Accounts for the lack of a comma at the end if the longest range is the last
        IF (i .EQ. input_len) THEN
            curr_range_len = (i - array_start) + 1
        END IF

        IF (curr_range_len .GT. max_range_len) THEN
            max_range_len = curr_range_len
        END IF
    END DO

    ALLOCATE(CHARACTER(max_range_len) :: ranges_array(range_count))

END PROGRAM day_2