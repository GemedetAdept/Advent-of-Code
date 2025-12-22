build := gfortran
filename := day_1
module1 := mod_instructions
module2 := mod_dial
module3 := mod_password

main:
	$(build) $(filename).f90 -o $(filename)
	./$(filename)

modules:
	$(build) -o $(filename) -O3 $(filename).f90 $(module1).f90 $(module2).f90 $(module3).f90
	./$(filename)