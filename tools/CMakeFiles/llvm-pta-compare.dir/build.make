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
include tools/CMakeFiles/llvm-pta-compare.dir/depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/llvm-pta-compare.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/llvm-pta-compare.dir/flags.make

tools/CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.o: tools/CMakeFiles/llvm-pta-compare.dir/flags.make
tools/CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.o: tools/llvm-pta-compare.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wei/CLionProjects/Features/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.o"
	cd /home/wei/CLionProjects/Features/dg/tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.o -c /home/wei/CLionProjects/Features/dg/tools/llvm-pta-compare.cpp

tools/CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.i"
	cd /home/wei/CLionProjects/Features/dg/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wei/CLionProjects/Features/dg/tools/llvm-pta-compare.cpp > CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.i

tools/CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.s"
	cd /home/wei/CLionProjects/Features/dg/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wei/CLionProjects/Features/dg/tools/llvm-pta-compare.cpp -o CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.s

# Object files for target llvm-pta-compare
llvm__pta__compare_OBJECTS = \
"CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.o"

# External object files for target llvm-pta-compare
llvm__pta__compare_EXTERNAL_OBJECTS =

tools/llvm-pta-compare: tools/CMakeFiles/llvm-pta-compare.dir/llvm-pta-compare.cpp.o
tools/llvm-pta-compare: tools/CMakeFiles/llvm-pta-compare.dir/build.make
tools/llvm-pta-compare: lib/libLLVMpta.so
tools/llvm-pta-compare: lib/libPTA.so
tools/llvm-pta-compare: lib/libDGAnalysis.so
tools/llvm-pta-compare: tools/CMakeFiles/llvm-pta-compare.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wei/CLionProjects/Features/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable llvm-pta-compare"
	cd /home/wei/CLionProjects/Features/dg/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm-pta-compare.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/llvm-pta-compare.dir/build: tools/llvm-pta-compare

.PHONY : tools/CMakeFiles/llvm-pta-compare.dir/build

tools/CMakeFiles/llvm-pta-compare.dir/clean:
	cd /home/wei/CLionProjects/Features/dg/tools && $(CMAKE_COMMAND) -P CMakeFiles/llvm-pta-compare.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/llvm-pta-compare.dir/clean

tools/CMakeFiles/llvm-pta-compare.dir/depend:
	cd /home/wei/CLionProjects/Features/dg && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wei/CLionProjects/Features/dg /home/wei/CLionProjects/Features/dg/tools /home/wei/CLionProjects/Features/dg /home/wei/CLionProjects/Features/dg/tools /home/wei/CLionProjects/Features/dg/tools/CMakeFiles/llvm-pta-compare.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/CMakeFiles/llvm-pta-compare.dir/depend

