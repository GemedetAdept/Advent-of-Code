MODULE mod_joltage
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: total_output_joltage
CONTAINS

    FUNCTION total_output_joltage(arr_banks, battery_count) RESULT(total_joltage)
        CHARACTER(LEN=100), ALLOCATABLE, INTENT(IN) :: arr_banks(:)
        INTEGER, INTENT(IN) :: battery_count
        INTEGER(KIND=8) :: total_joltage

        INTEGER:: bank_len

        INTEGER:: i, j, k
        CHARACTER(LEN=:), ALLOCATABLE :: bank_out
        INTEGER(KIND=8) :: bank_val
        CHARACTER(LEN=1) :: max_val = "0"
        INTEGER:: max_index = 0

        ALLOCATE(CHARACTER(LEN=battery_count) :: bank_out)
        bank_len = LEN(arr_banks(1))
        total_joltage = 0

        DO i=1, SIZE(arr_banks)
            max_index = 0

            DO j=1, battery_count
                max_val = "0"

                DO k=max_index+1, bank_len-(battery_count-j)
                    IF (arr_banks(i)(k:k) > max_val) THEN
                        max_val = arr_banks(i)(k:k)
                        max_index = k
                    END IF
                END DO

                bank_out(j:j) = max_val
            END DO

            READ(bank_out, "(I8)") bank_val
            total_joltage = total_joltage + bank_val
        END DO        
    END FUNCTION total_output_joltage

END MODULE mod_joltage