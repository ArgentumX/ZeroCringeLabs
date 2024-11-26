#include "charset.h"
#include <iostream>

int main()
{

    std::string s1;
    char toAdd, toRemove;
    int k;
    std::cout << "Enter char setup: ";
    std::cin >> s1;
    CharSet a = CharSet(s1);
    std::cout << "Input A size: " << a.getSize() << std::endl;
    std::cout << "Enter char to add: ";
    std::cin >> toAdd;
    a.add(toAdd);
    std::cout << "Enter char to remove: ";
    std::cin >> toRemove;
    a.remove(toRemove);
    std::cout << "Enter copy border: ";
    std::cin >> k;
    std::cout << "A (base): " << static_cast<std::string>(a) << std::endl;
    CharSet b = CharSet(a, k);
    std::cout << "B: (copied): " << static_cast<std::string>(b) << std::endl;
    std::cout << "C: (from char to add): " << static_cast<std::string>((CharSet)toAdd) << std::endl;
}