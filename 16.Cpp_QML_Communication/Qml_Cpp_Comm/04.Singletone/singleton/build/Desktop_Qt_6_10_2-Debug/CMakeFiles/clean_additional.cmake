# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appsingleton_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appsingleton_autogen.dir/ParseCache.txt"
  "appsingleton_autogen"
  )
endif()
