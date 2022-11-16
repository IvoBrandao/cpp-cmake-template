#!/bin/bash

# the project root directory is two levels up from this script
PROJECT_ROOT_DIR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../"

# find all sources files in $(PROJECT_ROOT_DIR)/src and $(PROJECT_ROOT_DIR)/include $(PROJECT_ROOT_DIR)/libs recusively
ALL_SOURCE_FILES = $(find $(PROJECT_ROOT_DIR)/src $(PROJECT_ROOT_DIR)/include $(PROJECT_ROOT_DIR)/libs -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.hpp" -o -name "*.cc" -o -name "*.cxx" -o -name "*.hh" -o -name "*.hxx" -o -name "*.inl")

CLANG_FORMAT_CONFIG_FILE = $(PROJECT_ROOT_DIR)/.clang-format

CLANG_VERSION=15

echo "Running clang-format... (version $CLANG_VERSION) in $(PROJECT_ROOT_DIR)"
echo "Using clang-format version $CLANG_VERSION"

# Run clang-format on all source files
for FILE in $ALL_SOURCE_FILES; do
    echo "Formatting $FILE" 
    # use clang format version 15 to format each file using the config file
    clang-format-$CLANG_VERSION -i -style=file $FILE
done

echo "Done."
exit 0