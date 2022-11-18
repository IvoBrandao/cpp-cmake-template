#include "ClassName.hpp"
#include <iostream>


namespace submodule_namespace 
{


ClassName::ClassName()
{
    std::cout << "ClassName constructor" << std::endl;
}

ClassName::~ClassName()
{
    std::cout << "ClassName destructor" << std::endl;
}

void ClassName::some_function()
{
    std::cout << "ClassName function" << std::endl;
}

}
