build := gfortran
filename := day_1
module1 := mod_functions

main:
	$(build) $(filename).f90 -o $(filename)
	./$(filename)

modules:
	$(build) -o $(filename) $(filename).f90 $(module1).f90
	./$(filename)