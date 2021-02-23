#include <cstdio>
#include <iostream>
#include <string>

int main() {
    std::string str = "hello wasi-sdk!";
    std::cout << str << std::endl;
    std::printf("%s\n", str.c_str());

    return 0;
}
