cmake_minimum_required(VERSION 4.1.2)
project(
  ZeroQ
  DESCRIPTION "A simple async C++ Web Server"
  LANGUAGES CXX
)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
add_executable(ZeroQ main.cpp)
