cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
project (dict-check CXX)

find_package (LLVM REQUIRED CONFIG)

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti") 

set (CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR})
find_package (LibClangTools REQUIRED)

set (CMAKE_INCLUDE_CURRENT_DIR ON)
set (CMAKE_CXX_STANDARD 14)
set (CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_EXTENSIONS OFF)

message (STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message (STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

include_directories (${LLVM_INCLUDE_DIRS})
add_definitions (${LLVM_DEFINITIONS})

add_executable (dict-check dict-check.cpp)

llvm_map_components_to_libnames (llvm_libs core)

message (STATUS "libs: ${LibClangTools_LIBRARIES}")

target_link_libraries (dict-check ${llvm_libs} ${LibClangTools_LIBRARIES})
