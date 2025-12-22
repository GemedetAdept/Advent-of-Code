build := gfortran
filename := day_1
module1 := mod_instructions
module2 := mod_dial

main:
	$(build) $(filename).f90 -o $(filename)
	./$(filename)

modules:
	$(build) -o $(filename) -O3 $(filename).f90 $(module1).f90 $(module2).f90
	./$(filename)