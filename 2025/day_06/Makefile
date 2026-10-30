build := gfortran
filename := day_06
src := $(filename).f90\
		mod_util.f90
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
			-g\
			-o

prod:
	$(build) $(prod_flags) $(filename) ${src}
	./$(filename)

debug:
	$(build) $(debug_flags) $(filename) ${src}
	./$(filename)