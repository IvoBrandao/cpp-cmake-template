
# set the libraries to link against tests
set (LIBRARIES submodule)


enable_testing()

file(GLOB_RECURSE TEST_SOURCES LIST_DIRECTORIES false tests_*.hpp tests_*.cpp)

foreach(_source IN ITEMS ${TEST_SOURCES})

    # get filename without extension from _source variable
    get_filename_component(_name ${_source} NAME_WE)

    set(TEST_NAME ${_name})

    # add test executable
    add_executable(${TEST_NAME} ${_source})

    # link test executable against gtest & gtest_main
    target_link_libraries(${TEST_NAME} gtest gtest_main gmock gmock_main ${LIBRARIES})

    # add test to CTest
    add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})

endforeach()

