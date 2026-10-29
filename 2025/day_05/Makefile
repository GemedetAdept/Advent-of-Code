build := gfortran
filename := day_05
src := $(filename).f90\
		mod_parse.f90\
		mod_sort.f90\
		mod_merge.f90
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