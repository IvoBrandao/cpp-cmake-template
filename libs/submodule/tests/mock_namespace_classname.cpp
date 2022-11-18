#include "mock_namespace_classname.hpp"
#include <iostream>

namespace submodule_namespace {

IMockClassName* IMockClassName::get_instance()
{
    static IMockClassName* instance = nullptr;
    if (instance == nullptr)
    {
        instance = new InternalMockIMockClassName();
    }
    return instance;
}

InternalMockIMockClassName::InternalMockIMockClassName()
{
    std::cout << "InternalMockIMockClassName constructor" << std::endl;
}

InternalMockIMockClassName::~InternalMockIMockClassName()
{
    std::cout << "InternalMockIMockClassName destructor" << std::endl;
}

const char* ClassName_MockImplNotSetException::what() const throw()
{
    return "ClassName_MockImplNotSetException";
}

void ClassName::some_function()
{
    try
    {
        IMockClassName::get_instance()->some_function();
    }
    catch (ClassName_MockImplNotSetException& e)
    {
        std::cout << e.what() << std::endl;
    }

} // namespace submodule_namespace


