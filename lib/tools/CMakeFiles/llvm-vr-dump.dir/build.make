# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/wei/anaconda3/bin/cmake

# The command to remove a file.
RM = /home/wei/anaconda3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wei/Downloads/dg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wei/Downloads/dg

# Include any dependencies generated for this target.
include tools/CMakeFiles/llvm-vr-dump.dir/depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/llvm-vr-dump.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/llvm-vr-dump.dir/flags.make

tools/CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.o: tools/CMakeFiles/llvm-vr-dump.dir/flags.make
tools/CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.o: tools/llvm-vr-dump.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wei/Downloads/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.o"
	cd /home/wei/Downloads/dg/tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.o -c /home/wei/Downloads/dg/tools/llvm-vr-dump.cpp

tools/CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.i"
	cd /home/wei/Downloads/dg/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wei/Downloads/dg/tools/llvm-vr-dump.cpp > CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.i

tools/CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.s"
	cd /home/wei/Downloads/dg/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wei/Downloads/dg/tools/llvm-vr-dump.cpp -o CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.s

# Object files for target llvm-vr-dump
llvm__vr__dump_OBJECTS = \
"CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.o"

# External object files for target llvm-vr-dump
llvm__vr__dump_EXTERNAL_OBJECTS =

tools/llvm-vr-dump: tools/CMakeFiles/llvm-vr-dump.dir/llvm-vr-dump.cpp.o
tools/llvm-vr-dump: tools/CMakeFiles/llvm-vr-dump.dir/build.make
tools/llvm-vr-dump: tools/CMakeFiles/llvm-vr-dump.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wei/Downloads/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable llvm-vr-dump"
	cd /home/wei/Downloads/dg/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm-vr-dump.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/llvm-vr-dump.dir/build: tools/llvm-vr-dump

.PHONY : tools/CMakeFiles/llvm-vr-dump.dir/build

tools/CMakeFiles/llvm-vr-dump.dir/clean:
	cd /home/wei/Downloads/dg/tools && $(CMAKE_COMMAND) -P CMakeFiles/llvm-vr-dump.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/llvm-vr-dump.dir/clean

tools/CMakeFiles/llvm-vr-dump.dir/depend:
	cd /home/wei/Downloads/dg && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wei/Downloads/dg /home/wei/Downloads/dg/tools /home/wei/Downloads/dg /home/wei/Downloads/dg/tools /home/wei/Downloads/dg/tools/CMakeFiles/llvm-vr-dump.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/CMakeFiles/llvm-vr-dump.dir/depend

