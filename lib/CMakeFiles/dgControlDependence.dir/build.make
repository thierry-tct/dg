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
include lib/CMakeFiles/dgControlDependence.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/dgControlDependence.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/dgControlDependence.dir/flags.make

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.o: lib/CMakeFiles/dgControlDependence.dir/flags.make
lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.o: lib/llvm/analysis/ControlDependence/Block.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wei/Downloads/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.o"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.o -c /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/Block.cpp

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.i"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/Block.cpp > CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.i

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.s"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/Block.cpp -o CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.s

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.o: lib/CMakeFiles/dgControlDependence.dir/flags.make
lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.o: lib/llvm/analysis/ControlDependence/Function.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wei/Downloads/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.o"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.o -c /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/Function.cpp

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.i"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/Function.cpp > CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.i

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.s"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/Function.cpp -o CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.s

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.o: lib/CMakeFiles/dgControlDependence.dir/flags.make
lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.o: lib/llvm/analysis/ControlDependence/GraphBuilder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wei/Downloads/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.o"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.o -c /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/GraphBuilder.cpp

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.i"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/GraphBuilder.cpp > CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.i

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.s"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/GraphBuilder.cpp -o CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.s

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.o: lib/CMakeFiles/dgControlDependence.dir/flags.make
lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.o: lib/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wei/Downloads/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.o"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.o -c /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.i"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp > CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.i

lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.s"
	cd /home/wei/Downloads/dg/lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wei/Downloads/dg/lib/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp -o CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.s

# Object files for target dgControlDependence
dgControlDependence_OBJECTS = \
"CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.o" \
"CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.o" \
"CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.o" \
"CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.o"

# External object files for target dgControlDependence
dgControlDependence_EXTERNAL_OBJECTS =

lib/libdgControlDependence.so: lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Block.cpp.o
lib/libdgControlDependence.so: lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/Function.cpp.o
lib/libdgControlDependence.so: lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/GraphBuilder.cpp.o
lib/libdgControlDependence.so: lib/CMakeFiles/dgControlDependence.dir/llvm/analysis/ControlDependence/NonTerminationSensitiveControlDependencyAnalysis.cpp.o
lib/libdgControlDependence.so: lib/CMakeFiles/dgControlDependence.dir/build.make
lib/libdgControlDependence.so: lib/CMakeFiles/dgControlDependence.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wei/Downloads/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library libdgControlDependence.so"
	cd /home/wei/Downloads/dg/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dgControlDependence.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/dgControlDependence.dir/build: lib/libdgControlDependence.so

.PHONY : lib/CMakeFiles/dgControlDependence.dir/build

lib/CMakeFiles/dgControlDependence.dir/clean:
	cd /home/wei/Downloads/dg/lib && $(CMAKE_COMMAND) -P CMakeFiles/dgControlDependence.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/dgControlDependence.dir/clean

lib/CMakeFiles/dgControlDependence.dir/depend:
	cd /home/wei/Downloads/dg && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wei/Downloads/dg /home/wei/Downloads/dg/lib /home/wei/Downloads/dg /home/wei/Downloads/dg/lib /home/wei/Downloads/dg/lib/CMakeFiles/dgControlDependence.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/dgControlDependence.dir/depend

