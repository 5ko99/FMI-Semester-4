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
CMAKE_COMMAND = /cygdrive/c/Users/petko/.CLion2019.3/system/cygwin_cmake/bin/cmake.exe

# The command to remove a file.
RM = /cygdrive/c/Users/petko/.CLion2019.3/system/cygwin_cmake/bin/cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/SysAdmin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/SysAdmin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SysAdmin.dir/flags.make

CMakeFiles/SysAdmin.dir/main.cpp.o: CMakeFiles/SysAdmin.dir/flags.make
CMakeFiles/SysAdmin.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/SysAdmin.dir/main.cpp.o"
	/usr/bin/c++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SysAdmin.dir/main.cpp.o -c /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/main.cpp

CMakeFiles/SysAdmin.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SysAdmin.dir/main.cpp.i"
	/usr/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/main.cpp > CMakeFiles/SysAdmin.dir/main.cpp.i

CMakeFiles/SysAdmin.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SysAdmin.dir/main.cpp.s"
	/usr/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/main.cpp -o CMakeFiles/SysAdmin.dir/main.cpp.s

# Object files for target SysAdmin
SysAdmin_OBJECTS = \
"CMakeFiles/SysAdmin.dir/main.cpp.o"

# External object files for target SysAdmin
SysAdmin_EXTERNAL_OBJECTS =

SysAdmin.exe: CMakeFiles/SysAdmin.dir/main.cpp.o
SysAdmin.exe: CMakeFiles/SysAdmin.dir/build.make
SysAdmin.exe: CMakeFiles/SysAdmin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable SysAdmin.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SysAdmin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SysAdmin.dir/build: SysAdmin.exe

.PHONY : CMakeFiles/SysAdmin.dir/build

CMakeFiles/SysAdmin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SysAdmin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SysAdmin.dir/clean

CMakeFiles/SysAdmin.dir/depend:
	cd /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/cmake-build-debug /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/cmake-build-debug /cygdrive/d/Workspace/FMI-Semester-4/Homework/SysAdmin/cmake-build-debug/CMakeFiles/SysAdmin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SysAdmin.dir/depend

