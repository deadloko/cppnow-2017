find_package(LLVM REQUIRED)

 
foreach (lib clangTooling clangFrontend clangSerialization clangDriver clangParse clangSema clangAnalysis clangEdit clangAST clangLex clangBasic clangASTMatchers clangFrontendTool clangRewriteFrontend clangToolingCore clangRewrite)
  find_library(LibClangTools_${lib}_LIBRARY NAMES ${lib} PATHS ${LLVM_LIB_DIR})
  mark_as_advanced(LibClangTools_${lib}_LIBRARY)
  list(APPEND LibClangTools_LIBRARIES ${LibClangTools_${lib}_LIBRARY})
endforeach()
list(APPEND LibClangTools_LIBRARIES ${LLVM_LIBRARIES})

set(LibClangTools_INCLUDE_DIRS ${LLVM_INCLUDE_DIRS})
set(LibClangTools_DEFINITIONS ${LLVM_DEFINITIONS})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibClangTools DEFAULT_MSG LibClangTools_LIBRARIES LibClangTools_INCLUDE_DIRS)
