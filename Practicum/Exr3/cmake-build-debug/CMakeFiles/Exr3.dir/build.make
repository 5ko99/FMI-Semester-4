# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.15

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = C:\Users\grade\AppData\Local\JetBrains\Toolbox\apps\CLion\ch-0\193.6494.38\bin\cmake\win\bin\cmake.exe

# The command to remove a file.
RM = C:\Users\grade\AppData\Local\JetBrains\Toolbox\apps\CLion\ch-0\193.6494.38\bin\cmake\win\bin\cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\Petko\Exr3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Petko\Exr3\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Exr3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Exr3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Exr3.dir/flags.make

CMakeFiles/Exr3.dir/main.cpp.obj: CMakeFiles/Exr3.dir/flags.make
CMakeFiles/Exr3.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Petko\Exr3\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Exr3.dir/main.cpp.obj"
	C:\PROGRA~1\HASKEL~1\86E4AC~1.5\mingw\bin\G__~1.EXE  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\Exr3.dir\main.cpp.obj -c D:\Petko\Exr3\main.cpp

CMakeFiles/Exr3.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Exr3.dir/main.cpp.i"
	C:\PROGRA~1\HASKEL~1\86E4AC~1.5\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\Petko\Exr3\main.cpp > CMakeFiles\Exr3.dir\main.cpp.i

CMakeFiles/Exr3.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Exr3.dir/main.cpp.s"
	C:\PROGRA~1\HASKEL~1\86E4AC~1.5\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\Petko\Exr3\main.cpp -o CMakeFiles\Exr3.dir\main.cpp.s

# Object files for target Exr3
Exr3_OBJECTS = \
"CMakeFiles/Exr3.dir/main.cpp.obj"

# External object files for target Exr3
Exr3_EXTERNAL_OBJECTS =

Exr3.exe: CMakeFiles/Exr3.dir/main.cpp.obj
Exr3.exe: CMakeFiles/Exr3.dir/build.make
Exr3.exe: CMakeFiles/Exr3.dir/linklibs.rsp
Exr3.exe: CMakeFiles/Exr3.dir/objects1.rsp
Exr3.exe: CMakeFiles/Exr3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Petko\Exr3\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Exr3.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\Exr3.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Exr3.dir/build: Exr3.exe

.PHONY : CMakeFiles/Exr3.dir/build

CMakeFiles/Exr3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\Exr3.dir\cmake_clean.cmake
.PHONY : CMakeFiles/Exr3.dir/clean

CMakeFiles/Exr3.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Petko\Exr3 D:\Petko\Exr3 D:\Petko\Exr3\cmake-build-debug D:\Petko\Exr3\cmake-build-debug D:\Petko\Exr3\cmake-build-debug\CMakeFiles\Exr3.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Exr3.dir/depend

