#.rst:
# FindLibzookeeper
# --------
#
# Find the native libzookeeper includes and library.
#
# IMPORTED Targets
# ^^^^^^^^^^^^^^^^
#
#
# Result Variables
# ^^^^^^^^^^^^^^^^
#
# This module defines the following variables:
#
# ::
#
#   Libzookeeper_INCLUDE_DIRS       - where to find zookeeper/zookeeper_version.h, etc.
#   Libzookeeper_EXECUTABLE         - Path of load_gen.
#   Libzookeeper_EXECUTABLE_CLI_ST  - Path of cli_st.
#   Libzookeeper_EXECUTABLE_CLI_MT  - Path of cli_mt.
#   Libzookeeper_LIBRARIES          - List of libraries when using libzookeeper.
#   Libzookeeper_LIBRARIE_MT        - List of libraries of zookeeper_mt.
#   Libzookeeper_LIBRARIE_ST        - List of libraries of zookeeper_st.
#   Libzookeeper_FOUND              - True if libuv found.
#
# ::
#
#
# Hints
# ^^^^^
#
# This module reads hints about search locations from variables:
#  Libzookeeper_ROOT            - Preferred installation prefix
#   (or Libzookeeper_ROOT)
#
#=============================================================================
# Copyright 2014-2015 OWenT.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

unset(_Libzookeeper_SEARCH_ROOT)

if(Libzookeeper_ROOT)
  set(LIBZOOKEEPER_ROOT ${Libzookeeper_ROOT})
endif()

# Search LIBUV_ROOT first if it is set.
if(LIBZOOKEEPER_ROOT)
  set(_Libzookeeper_SEARCH_ROOT PATHS ${LIBZOOKEEPER_ROOT} NO_DEFAULT_PATH)
endif()

set(Libzookeeper_NAMES_MT zookeeper_mt libzookeeper_mt)
set(Libzookeeper_NAMES_ST zookeeper_st libzookeeper_st)

# Try each search configuration.
find_path(Libzookeeper_INCLUDE_DIRS NAMES "zookeeper/zookeeper_version.h" ${_Libzookeeper_SEARCH_ROOT})

find_program(Libzookeeper_EXECUTABLE NAMES load_gen ${_Libzookeeper_SEARCH_ROOT})
find_program(Libzookeeper_EXECUTABLE_CLI_ST NAMES cli_st ${_Libzookeeper_SEARCH_ROOT})
find_program(Libzookeeper_EXECUTABLE_CLI_MT NAMES cli_mt ${_Libzookeeper_SEARCH_ROOT})

find_library(Libzookeeper_LIBRARIE_MT  NAMES ${Libzookeeper_NAMES_MT} ${_Libzookeeper_SEARCH_ROOT})
find_library(Libzookeeper_LIBRARIE_ST  NAMES ${Libzookeeper_NAMES_ST} ${_Libzookeeper_SEARCH_ROOT})
set(Libzookeeper_LIBRARIES ${Libzookeeper_LIBRARIE_MT} ${Libzookeeper_LIBRARIE_ST})

mark_as_advanced(
    Libzookeeper_LIBRARIE_MT Libzookeeper_LIBRARIE_ST Libzookeeper_LIBRARIES
    Libzookeeper_INCLUDE_DIRS
    Libzookeeper_EXECUTABLE Libzookeeper_EXECUTABLE_CLI_ST Libzookeeper_EXECUTABLE_CLI_MT
)

# handle the QUIETLY and REQUIRED arguments and set Libzookeeper_FOUND to TRUE if
# all listed variables are TRUE
include("FindPackageHandleStandardArgs")
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Libzookeeper
  REQUIRED_VARS
    Libzookeeper_LIBRARIE_MT Libzookeeper_LIBRARIE_ST Libzookeeper_LIBRARIES
    Libzookeeper_INCLUDE_DIRS
    Libzookeeper_EXECUTABLE Libzookeeper_EXECUTABLE_CLI_ST Libzookeeper_EXECUTABLE_CLI_MT
  FOUND_VAR Libzookeeper_FOUND
)

if(Libzookeeper_FOUND)
    set(LIBZOOKEEPER_FOUND ${Libzookeeper_FOUND})
endif()
