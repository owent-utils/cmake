#.rst:
# FindLuaJit
# --------
#
# Find the native libuv includes and library.
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
#   LuaJit_INCLUDE_DIRS   - where to find luajit.h, etc.
#   LuaJit_LIBRARIES      - List of libraries when using luajit.
#   LuaJit_FOUND          - True if libuv found.
#
# ::
#
#
# Hints
# ^^^^^
#
# This module reads hints about search locations from variables:
#  LuaJit_ROOT            - Preferred installation prefix
#   (or LuaJit_ROOT)
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

unset(_LUAJIT_SEARCH_ROOT)

if(LuaJit_ROOT)
  set(LUAJIT_ROOT ${LuaJit_ROOT})
endif()

# Search LIBUV_ROOT first if it is set.
if(LUAJIT_ROOT)
  set(_LUAJIT_SEARCH_ROOT PATHS ${LUAJIT_ROOT} NO_DEFAULT_PATH)
endif()

set(LuaJit_NAMES luajit libluajit)

# Try each search configuration.
find_path(LuaJit_INCLUDE_DIR NAMES luajit.h        ${_LUAJIT_SEARCH_ROOT})
find_library(LuaJit_LIBRARY  NAMES ${LuaJit_NAMES} ${_LUAJIT_SEARCH_ROOT})

mark_as_advanced(LuaJit_LIBRARY LuaJit_INCLUDE_DIR)

# handle the QUIETLY and REQUIRED arguments and set LIBUV_FOUND to TRUE if
# all listed variables are TRUE
include("FindPackageHandleStandardArgs")
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LuaJit
  REQUIRED_VARS LuaJit_LIBRARY LuaJit_INCLUDE_DIR
  FOUND_VAR LuaJit_FOUND
)

if(LuaJit_FOUND)
    set(LuaJit_INCLUDE_DIRS ${LuaJit_INCLUDE_DIR})
    set(LuaJit_LIBRARIES ${LuaJit_LIBRARY})

    set(LUAJIT_FOUND ${LuaJit_FOUND})
endif()
