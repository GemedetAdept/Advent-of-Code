build := gfortran
filename := day_1
module1 := mod_instructions

main:
	$(build) $(filename).f90 -o $(filename)
	./$(filename)

modules:
	$(build) -o $(filename) -O3 $(filename).f90 $(module1).f90
	./$(filename)