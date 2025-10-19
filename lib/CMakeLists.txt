add_library(zeroq_lib
	src/test.cpp
)

target_include_directories(zeroq_lib
	PUBLIC include
	PRIVATE src ${asio_SOURCE_DIR}/asio/include
)