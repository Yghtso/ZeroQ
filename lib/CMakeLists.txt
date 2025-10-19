add_library(zeroq_lib
	src/test.cpp
	src/test.h
)

target_include_directories(zeroq_lib
	PUBLIC include
	PRIVATE src ${asio_SOURCE_DIR}/asio/include
)

target_compile_definitions(zeroq_lib PRIVATE ASIO_STANDALONE)