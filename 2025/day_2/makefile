build := gfortran
filename := day_2
src := $(filename).f90\
	   mod_range.f90\
	   mod_string_funcs.f90\
	   mod_instructions.f90\
	   mod_file_io.f90
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
	$(build) $(prod_flags) $(filename) $(filename).f90
	./$(filename)

debug:
	$(build) $(debug_flags) $(filename) ${src}
	./$(filename)