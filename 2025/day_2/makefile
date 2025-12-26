build := gfortran
filename := day_2
modules := mod_range.f90

main:
	$(build) -o $(filename) $(filename).f90 -O3 -Wall -fcheck=all -g -fbacktrace
	./$(filename)

modules:
	$(build) -o $(filename) -O3 $(filename).f90 ${modules} -Wall -fcheck=all -g -fbacktrace
	./$(filename)