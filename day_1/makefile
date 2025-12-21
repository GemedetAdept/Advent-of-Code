build := gfortran
filename := day_1
module1 := instructions_module

main:
	$(build) $(filename).f90 -o $(filename)
	./$(filename)


modules:
	$(build) $(filename).f90 -o $(filename)
	$(build) -c $(module1).f90
	$(build) $(filename).f90 $(module1).o