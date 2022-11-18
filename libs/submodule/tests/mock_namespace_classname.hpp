#ifndef MOCK_SUBMODULE_CLASSNAME1_HPP_
#define MOCK_SUBMODULE_CLASSNAME1_HPP_

#include "gmock/gmock.h"

#include "ClassName.hpp"

namespace submodule_namespace {


class IMockClassName
{
    public:

        virtual ~IMockClassName() = default;

        virtual void some_function() = 0;
};

class InternalMockIMockClassName : public IMockClassName
{
    public:

        InternalMockIMockClassName();

        virtual ~InternalMockIMockClassName();

        static IMockClassName* get_instance();

        MOCK_METHOD0(some_function, void());
};      

class ClassName_MockImplNotSetException : public std::exception
{
    public:

        virtual const char* what() const throw();
};

} // namespace submodule_namespace

#endif // MOCK_SUBMODULE_CLASSNAME1_HPP_
