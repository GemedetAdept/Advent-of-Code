build := gfortran
filename := day_04
src := $(filename).f90\
		mod_moore.f90
debug_flags := -Og\
			-Wall\
			-Wextra\
			-Wconversion\
			-fcheck=all\
			-g\
			-fbacktrace\
			-pedantic\
			-o
prod_flags := -O3\
			-fimplicit-none\
			-Wall\
			-g\
			-o

prod:
	$(build) $(prod_flags) $(filename) ${src}
	./$(filename)

debug:
	$(build) $(debug_flags) $(filename) ${src}
	./$(filename)