# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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
CMAKE_COMMAND = /home/wei/ide/clion-2019.3/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/wei/ide/clion-2019.3/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wei/CLionProjects/Features/dg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wei/CLionProjects/Features/dg

# Include any dependencies generated for this target.
include tests/CMakeFiles/points-to-test.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/points-to-test.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/points-to-test.dir/flags.make

tests/CMakeFiles/points-to-test.dir/points-to-test.cpp.o: tests/CMakeFiles/points-to-test.dir/flags.make
tests/CMakeFiles/points-to-test.dir/points-to-test.cpp.o: tests/points-to-test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wei/CLionProjects/Features/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/points-to-test.dir/points-to-test.cpp.o"
	cd /home/wei/CLionProjects/Features/dg/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/points-to-test.dir/points-to-test.cpp.o -c /home/wei/CLionProjects/Features/dg/tests/points-to-test.cpp

tests/CMakeFiles/points-to-test.dir/points-to-test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/points-to-test.dir/points-to-test.cpp.i"
	cd /home/wei/CLionProjects/Features/dg/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wei/CLionProjects/Features/dg/tests/points-to-test.cpp > CMakeFiles/points-to-test.dir/points-to-test.cpp.i

tests/CMakeFiles/points-to-test.dir/points-to-test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/points-to-test.dir/points-to-test.cpp.s"
	cd /home/wei/CLionProjects/Features/dg/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wei/CLionProjects/Features/dg/tests/points-to-test.cpp -o CMakeFiles/points-to-test.dir/points-to-test.cpp.s

# Object files for target points-to-test
points__to__test_OBJECTS = \
"CMakeFiles/points-to-test.dir/points-to-test.cpp.o"

# External object files for target points-to-test
points__to__test_EXTERNAL_OBJECTS =

tests/points-to-test: tests/CMakeFiles/points-to-test.dir/points-to-test.cpp.o
tests/points-to-test: tests/CMakeFiles/points-to-test.dir/build.make
tests/points-to-test: lib/libPTA.so
tests/points-to-test: lib/libDGAnalysis.so
tests/points-to-test: tests/CMakeFiles/points-to-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wei/CLionProjects/Features/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable points-to-test"
	cd /home/wei/CLionProjects/Features/dg/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/points-to-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/points-to-test.dir/build: tests/points-to-test

.PHONY : tests/CMakeFiles/points-to-test.dir/build

tests/CMakeFiles/points-to-test.dir/clean:
	cd /home/wei/CLionProjects/Features/dg/tests && $(CMAKE_COMMAND) -P CMakeFiles/points-to-test.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/points-to-test.dir/clean

tests/CMakeFiles/points-to-test.dir/depend:
	cd /home/wei/CLionProjects/Features/dg && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wei/CLionProjects/Features/dg /home/wei/CLionProjects/Features/dg/tests /home/wei/CLionProjects/Features/dg /home/wei/CLionProjects/Features/dg/tests /home/wei/CLionProjects/Features/dg/tests/CMakeFiles/points-to-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/points-to-test.dir/depend

