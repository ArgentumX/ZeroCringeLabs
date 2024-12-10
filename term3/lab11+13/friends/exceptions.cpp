#include <iostream>
#include <set>
#include <stdexcept>
#include "charset.h"

// Base exception
class Exception {
protected:
    std::string message; 
public:
    std::string getMessage() const{
        return this->message;
    }
};


class SetContainsCharException : public Exception{
public:
    SetContainsCharException(){
        this->message = ((std::string)"Set already contains symbol"); 
    }
};

class SetNotContainsCharException : public Exception{
public:
    SetNotContainsCharException(){
        this->message = ((std::string)"Set already not contains symbol"); 
    }
};

class NotAllowedSymbolException : public Exception{
public:
    NotAllowedSymbolException(){
        this->message = "Unable to use unprintable symbols";
    }
};


class EmptySetException : public Exception{
public:
    EmptySetException(){
        this->message = "Got empty set";
    }
};