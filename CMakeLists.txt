cmake_minimum_required(VERSION 3.1)

set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/external CACHE PATH "" FORCE)

set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} /MT")
set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO} /MT")

project(PreBuildDimProj C CXX)

find_package(OPENGL REQUIRED)

set(GLFW_BUILD_DOCS OFF)
set(GLFW_BUILD_TESTS OFF)
set(GLFW_BUILD_EXAMPLES OFF)
add_subdirectory(external/glfw)

add_library(imgui
  external/imgui/imgui.cpp
  external/imgui/imgui_draw.cpp
  external/imgui/imgui_widgets.cpp
  external/imgui/imgui_demo.cpp
  external/imgui/examples/imgui_impl_opengl2.cpp
  external/imgui/examples/imgui_impl_glfw.cpp
)
target_include_directories(imgui PRIVATE external/imgui)
target_link_libraries(imgui OpenGL::GL glfw)

install(TARGETS imgui)
