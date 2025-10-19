add_executable(zeroq
	src/main.cpp
)

target_link_libraries(zeroq
	PRIVATE
	zeroq_lib
)