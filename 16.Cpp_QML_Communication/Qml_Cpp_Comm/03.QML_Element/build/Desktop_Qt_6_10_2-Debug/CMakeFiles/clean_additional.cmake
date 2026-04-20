# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appQML_ELEMENT_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appQML_ELEMENT_autogen.dir/ParseCache.txt"
  "appQML_ELEMENT_autogen"
  )
endif()
