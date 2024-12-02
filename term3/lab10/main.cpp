#include "charset.h"
#include <iostream>

int main()
{

    std::string s1, s2;
    std::cout << "Enter A char setup: ";
    std::cin >> s1;
    CharSet a = CharSet(s1);
    std::cout << "Enter B char setup: ";
    std::cin >> s2;
    CharSet b = CharSet(s2);
    std::cout << "A (base): " << static_cast<std::string>(a) << std::endl;
    std::cout << "B (base): " << static_cast<std::string>(b) << std::endl;
    std::cout << "A + B: " << static_cast<std::string>(a + b) << std::endl;
    std::cout << "A - B: " << static_cast<std::string>(a - b) << std::endl;
    std::cout << "A * B: " << static_cast<std::string>(a * b) << std::endl;
    std::cout << "A == B: " << (a == b) << std::endl;
}