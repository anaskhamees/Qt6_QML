# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appsignal_slot_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appsignal_slot_autogen.dir/ParseCache.txt"
  "appsignal_slot_autogen"
  )
endif()
