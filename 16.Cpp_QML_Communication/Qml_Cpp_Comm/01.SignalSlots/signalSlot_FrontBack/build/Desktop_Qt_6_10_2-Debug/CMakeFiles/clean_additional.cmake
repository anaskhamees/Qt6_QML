# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appcppSignal_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appcppSignal_autogen.dir/ParseCache.txt"
  "appcppSignal_autogen"
  )
endif()
