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

# Utility rule file for thread-regions-test-file.

# Include the progress variables for this target.
include tests/CMakeFiles/thread-regions-test-file.dir/progress.make

tests/CMakeFiles/thread-regions-test-file: tests/simple.ll


tests/simple.ll: tests/thread-regions-test-files/simple.c
tests/simple.ll: tests/thread-regions-test-files/pthread_exit.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/wei/CLionProjects/Features/dg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating simple.ll, pthread_exit.ll"
	cd /home/wei/CLionProjects/Features/dg/tests && clang -S -emit-llvm /home/wei/CLionProjects/Features/dg/tests/thread-regions-test-files/simple.c
	cd /home/wei/CLionProjects/Features/dg/tests && clang -S -emit-llvm /home/wei/CLionProjects/Features/dg/tests/thread-regions-test-files/pthread_exit.c

tests/pthread_exit.ll: tests/simple.ll
	@$(CMAKE_COMMAND) -E touch_nocreate tests/pthread_exit.ll

thread-regions-test-file: tests/CMakeFiles/thread-regions-test-file
thread-regions-test-file: tests/simple.ll
thread-regions-test-file: tests/pthread_exit.ll
thread-regions-test-file: tests/CMakeFiles/thread-regions-test-file.dir/build.make

.PHONY : thread-regions-test-file

# Rule to build all files generated by this target.
tests/CMakeFiles/thread-regions-test-file.dir/build: thread-regions-test-file

.PHONY : tests/CMakeFiles/thread-regions-test-file.dir/build

tests/CMakeFiles/thread-regions-test-file.dir/clean:
	cd /home/wei/CLionProjects/Features/dg/tests && $(CMAKE_COMMAND) -P CMakeFiles/thread-regions-test-file.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/thread-regions-test-file.dir/clean

tests/CMakeFiles/thread-regions-test-file.dir/depend:
	cd /home/wei/CLionProjects/Features/dg && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wei/CLionProjects/Features/dg /home/wei/CLionProjects/Features/dg/tests /home/wei/CLionProjects/Features/dg /home/wei/CLionProjects/Features/dg/tests /home/wei/CLionProjects/Features/dg/tests/CMakeFiles/thread-regions-test-file.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/thread-regions-test-file.dir/depend

