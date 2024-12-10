#include "charset.h"
#include <iostream>
#include "exceptions.cpp"

int main()
{

    try {
        std::string s1, s2;
        std::cout << "Enter A char setup: ";
        std::cin >> s1;
        CharSet a = CharSet(s1);
        
        std::string str = "Helo";
        CharSet result = str + a;

        std::cout << "Enter B char setup: ";
        std::cin >> s2;
        CharSet b = CharSet(s2);
        std::cout
            << "A (base): " << static_cast<std::string>(a) << std::endl;
        std::cout << "B (base): " << static_cast<std::string>(b) << std::endl;
        CharSet c1 = a + b;
        c1 += 'a';
        std::cout << "A + B: " << static_cast<std::string>(c1) << std::endl;
        CharSet c2 = a - b;
        std::cout << "A - B: " << static_cast<std::string>(c2) << std::endl;
        CharSet c3 = a * b;
        std::cout << "A * B: " << static_cast<std::string>(c3) << std::endl;
        std::cout << "A == B: " << (a == b) << std::endl;
    } catch (Exception e){
        std::cout << "catched exception: "  << e.getMessage() << std::endl;
    }
}