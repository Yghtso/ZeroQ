cmake_minimum_required(VERSION 4.1.0)

project(
	STM
	DESCRIPTION "A basic language implemented in c++"
	LANGUAGES CXX
	VERSION 0.1.0
)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(project_options)
include(dependencies)

add_subdirectory(lib)
add_subdirectory(app)