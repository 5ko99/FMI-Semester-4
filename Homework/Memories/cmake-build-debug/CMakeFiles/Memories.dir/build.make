# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /snap/clion/111/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/111/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/petko/Workspace/FMI-Semester-4/Homework/Memories

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/petko/Workspace/FMI-Semester-4/Homework/Memories/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Memories.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Memories.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Memories.dir/flags.make

CMakeFiles/Memories.dir/main.cpp.o: CMakeFiles/Memories.dir/flags.make
CMakeFiles/Memories.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/petko/Workspace/FMI-Semester-4/Homework/Memories/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Memories.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Memories.dir/main.cpp.o -c /home/petko/Workspace/FMI-Semester-4/Homework/Memories/main.cpp

CMakeFiles/Memories.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Memories.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/petko/Workspace/FMI-Semester-4/Homework/Memories/main.cpp > CMakeFiles/Memories.dir/main.cpp.i

CMakeFiles/Memories.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Memories.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/petko/Workspace/FMI-Semester-4/Homework/Memories/main.cpp -o CMakeFiles/Memories.dir/main.cpp.s

# Object files for target Memories
Memories_OBJECTS = \
"CMakeFiles/Memories.dir/main.cpp.o"

# External object files for target Memories
Memories_EXTERNAL_OBJECTS =

Memories: CMakeFiles/Memories.dir/main.cpp.o
Memories: CMakeFiles/Memories.dir/build.make
Memories: CMakeFiles/Memories.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/petko/Workspace/FMI-Semester-4/Homework/Memories/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Memories"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Memories.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Memories.dir/build: Memories

.PHONY : CMakeFiles/Memories.dir/build

CMakeFiles/Memories.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Memories.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Memories.dir/clean

CMakeFiles/Memories.dir/depend:
	cd /home/petko/Workspace/FMI-Semester-4/Homework/Memories/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/petko/Workspace/FMI-Semester-4/Homework/Memories /home/petko/Workspace/FMI-Semester-4/Homework/Memories /home/petko/Workspace/FMI-Semester-4/Homework/Memories/cmake-build-debug /home/petko/Workspace/FMI-Semester-4/Homework/Memories/cmake-build-debug /home/petko/Workspace/FMI-Semester-4/Homework/Memories/cmake-build-debug/CMakeFiles/Memories.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Memories.dir/depend

