#include <gtest/gtest.h>


#include "mock_namespace_classname.hpp"

namespace submodule_namespace {

// test fixture
class ClassNameTest : public ::testing::Test
{
    protected:
        ClassNameTest() {}
        virtual ~ClassNameTest() {}
        virtual void SetUp() {}
        virtual void TearDown() {}
};


TEST_F(ClassNameTest, test1)
{

    // test code
    ClassName c;
    c.some_function();

}

} // namespace submodule_namespace



