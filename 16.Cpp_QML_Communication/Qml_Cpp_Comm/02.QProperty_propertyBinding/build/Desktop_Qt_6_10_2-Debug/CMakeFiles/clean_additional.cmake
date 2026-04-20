# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appQProperty__autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appQProperty__autogen.dir/ParseCache.txt"
  "appQProperty__autogen"
  )
endif()
