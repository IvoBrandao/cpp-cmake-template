add_subdirectory(docs)
add_subdirectory(tests)


add_library(submodule STATIC)

target_include_directories(submodule 
    PUBLIC 
        ${CMAKE_CURRENT_LIST_DIR}/include)

target_sources(submodule 
    PRIVATE 
        ${CMAKE_CURRENT_LIST_DIR}/src/submodule.cpp)

#add_dependencies(submodule library_name )
#target_link_libraries( submodule library_name)
