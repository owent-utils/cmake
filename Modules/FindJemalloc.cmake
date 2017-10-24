﻿#.rst:
# FindJemalloc
# --------
#
# Find the native jemalloc includes and library.
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
#   Jemalloc_INCLUDE_DIRS  - where to find jemalloc/jemalloc.h, etc.
#   Jemalloc_EXECUTABLE    - full path of pproc.
#   Jemalloc_LIBRARY_DIRS  - directory of libraries of jemalloc.
#   Jemalloc_FOUND         - True if jemalloc found.
#
# ::
#
#
# Hints
# ^^^^^
#
# This module reads hints about search locations from variables:
#  JEMALLOC_ROOT           - Preferred installation prefix
#   (or Jemalloc_ROOT)

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

unset(_JEMALLOC_SEARCH_ROOT)

# Search Jemalloc_ROOT first if it is set.
if(Jemalloc_ROOT)
    set(JEMALLOC_ROOT ${Jemalloc_ROOT})
endif()

if(JEMALLOC_ROOT)
  set(_JEMALLOC_SEARCH_ROOT PATHS ${JEMALLOC_ROOT} NO_DEFAULT_PATH)
endif()

set(JEMALLOC_NAMES jemalloc jemalloc_pic)

# Try each search configuration.
find_path(Jemalloc_INCLUDE_DIRS NAMES "jemalloc/jemalloc.h" ${_JEMALLOC_SEARCH_ROOT})
find_library(Jemalloc_LIBRARY_DIRS NAMES ${JEMALLOC_NAMES} ${_JEMALLOC_SEARCH_ROOT})
string(REGEX REPLACE "[/\\\\][^/\\\\]*$" "" Jemalloc_LIBRARY_DIRS "${Jemalloc_LIBRARY_DIRS}")

mark_as_advanced(Jemalloc_LIBRARY_DIRS Jemalloc_INCLUDE_DIRS )

# handle the QUIETLY and REQUIRED arguments and set Jemalloc_FOUND to TRUE if
# all listed variables are TRUE
include("FindPackageHandleStandardArgs")
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Jemalloc
  REQUIRED_VARS Jemalloc_INCLUDE_DIRS Jemalloc_LIBRARY_DIRS
  FOUND_VAR Jemalloc_FOUND
)

if (Jemalloc_FOUND)
    set(JEMALLOC_FOUND ${Jemalloc_FOUND})
endif()

