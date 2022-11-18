#include "main.hpp"
#include <iostream>
#include "ClassName.hpp"

int main() {

    std::cout << "Hello, World!" << std::endl;

    submodule_namespace::ClassName c;

    c.some_function();

    return 0;
}