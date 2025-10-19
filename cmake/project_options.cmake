option(ZEROQ_BUILD_TESTS "Build the project's tests" OFF)
option(ZEROQ_BUILD_EXAMPLES "Build the project's examples" OFF)
option(ZEROQ_BUILD_DOCS "Build the project's documentation" OFF)
option(ZEROQ_ENABLE_CLANG_TIDY "Enable static analysis with clang-tidy" OFF)
option(ZEROQ_ENABLE_COVERAGE "Enable code coverage reporting" OFF)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS OFF)

function(set_project_warnings target_name)
	set(MSVC_WARNINGS
		/W4     # Level 4 warnings
		/w14242 # 'ident': conversion from 'type1' to 'type2', possible loss of data
		/w14254 # 'operator': conversion from 'type1' to 'type2', possible loss of data
		/w14263 # 'function': member function does not override any base class virtual member function
		/w14265 # 'virtual_function': class has virtual functions, but destructor is not virtual
		/w14287 # 'operator': unsigned/negative constant mismatch
		/w14296 # 'operator': expression is always 'boolean_value'
		/w14311 # 'variable': pointer truncation from 'type1' to 'type2'
		/w14545 # expression before comma has no effect
		/w14546 # function call before comma has no effect
		/w14547 # 'operator': operator before comma has no effect
		/w14549 # 'operator': operator before comma has no effect
		/w14555 # expression has no effect
		/w14619 # 'variable': storage-class specifier illegally modified
		/w14640 # 'variable': Enable warning on thread un-safe static member initialization
		/w14826 # 'operator': conversion from 'type1' to 'type2' is sign-extended
		/w14905 # 'type': wide string literal cast to 'LPSTR'
		/w14906 # 'type': string literal cast to 'LPWSTR'
		/w14928 # 'type': illegal copy-initialization
		/WX     # Treat warnings as errors
	)

	set(CLANG_GCC_WARNINGS
		-Wall
		-Wextra
		-Wpedantic
		-Wshadow              # Warns if a local variable shadows another
		-Wnon-virtual-dtor    # Warns if a class with virtual functions has a non-virtual destructor
		-Wold-style-cast      # Warns for C-style casts
		-Wcast-align          # Warns for pointer casts that increase alignment requirements
		-Wunused              # Warns about unused variables
		-Woverloaded-virtual  # Warns about hidden virtual functions
		-Wconversion          # Warns about implicit conversions that may alter a value
		-Wsign-conversion     # Warns for implicit sign conversions
		-Wnull-dereference    # Warns for null pointer dereferences
		-Wdouble-promotion    # Warns about float to double promotion
		-Wformat=2            # Checks printf-style format strings
		-Werror               # Treat warnings as errors
	)

	if (MSVC)
		target_compile_options(${target_name} INTERFACE ${MSVC_WARNINGS})
	else ()
		target_compile_options(${target_name} INTERFACE ${CLANG_GCC_WARNINGS})
	endif ()
endfunction()