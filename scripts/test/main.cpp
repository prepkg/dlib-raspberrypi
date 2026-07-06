#include <iostream>
#include <dlib/revision.h>

int main(void) {
    std::cout << DLIB_MAJOR_VERSION << '.' << DLIB_MINOR_VERSION << '.' << DLIB_PATCH_VERSION << std::endl;

    return 0;
}
