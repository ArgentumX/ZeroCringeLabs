#include "charset.h"
#include <iostream>

bool CharSet::isPossibleChar(char s)
{
    int sint = static_cast<int>(s);
    return ((DOWN_BORDER <= sint) && (sint <= UP_BORDER));
}

int CharSet::getAsciiIdByTableId(int id)
{
    return id + DOWN_BORDER;
}
int CharSet::getTableIdByAsciiId(int id)
{
    return id - DOWN_BORDER;
}

CharSet::CharSet(std::string s)
{
    this->table = new bool[CAPACITY]();
    for (int i = 0; s[i] != '\0'; i++)
    {
        if (!isPossibleChar(s[i]))
        {
            std::cout << "Possible char error detected" << std::endl;
            continue;
        }
        (this->add)(s[i]);
    }
}

CharSet::CharSet(const CharSet &from, int k)
{
    this->table = new bool[CAPACITY]();
    for (int i = 0; i < CAPACITY; i++)
    {
        if (from.table[i] && getAsciiIdByTableId(i) <= k)
        {
            (this->add)(static_cast<char>(getAsciiIdByTableId(i)));
        }
    }
}

CharSet::~CharSet()
{
    delete[] this->table;
}

CharSet::CharSet(char s)
{
    this->table = new bool[CAPACITY]();
    table[getTableIdByAsciiId(s)] = true;
}
CharSet::operator char()
{
    return static_cast<char>((this->getSize)());
}

CharSet::operator std::string()
{

    std::string res = "";
    for (int i = 0; i < CAPACITY; i++)
    {
        if (this->table[i])
        {
            res += static_cast<char>(getAsciiIdByTableId(i));
        }
    }
    return res;
}

int CharSet::getSize() const
{
    int size = 0;
    for (int i = 0; i < CAPACITY; i++)
    {
        if (this->table[i])
            size++;
    }
    return size;
}
bool CharSet::contains(char s) const
{
    if (!(this->isPossibleChar)(s))
    {
        std::cout << "Not allowed symbol" << std::endl;
        return false;
    }
    return this->table[getTableIdByAsciiId(s)];
}
void CharSet::add(char s)
{
    if (!(this->isPossibleChar)(s))
    {
        std::cout << "Not allowed symbol" << std::endl;
        return;
    }
    if ((this->contains)(s))
    {
        std::cout << "Already contains " << s << std::endl;
        return;
    }
    this->table[getTableIdByAsciiId(s)] = true;
}

void CharSet::remove(char s)
{
    if (!(this->isPossibleChar)(s))
    {
        std::cout << "Not allowed symbol" << std::endl;
        return;
    }
    if (!(this->contains)(s))
    {
        std::cout << "Already not contains " << s << std::endl;
        return;
    }
    this->table[getTableIdByAsciiId(s)] = false;
}

CharSet &CharSet::operator+=(char s)
{
    (this->add)(s);
    return *this;
}

CharSet &CharSet::operator=(const CharSet &from)
{
    for (int i = 0; i < CAPACITY; i++)
    {
        this->table[i] = from.table[i];
    }
    return *this;
}
bool CharSet::operator==(const CharSet &other) const
{
    for (int i = 0; i < CAPACITY; i++)
    {
        if (this->table[i] != other.table[i])
        {
            return false;
        }
    }
    return true;
}

CharSet CharSet::operator+(const CharSet &other) const
{
    CharSet sum = CharSet();
    for (int i = 0; i < CAPACITY; i++)
    {
        if (this->table[i] || other.table[i])
        {
            sum.add(getAsciiIdByTableId(i));
        }
    }
    return sum;
}

CharSet CharSet::operator-(const CharSet &other) const
{
    CharSet sum = CharSet();
    for (int i = 0; i < CAPACITY; i++)
    {
        if (this->table[i] && !other.table[i])
        {
            sum.add(getAsciiIdByTableId(i));
        }
    }
    return sum;
}

CharSet CharSet::operator*(const CharSet &other) const
{
    CharSet sum = CharSet();
    for (int i = 0; i < CAPACITY; i++)
    {
        if (this->table[i] && other.table[i])
        {
            sum.add(getAsciiIdByTableId(i));
        }
    }
    return sum;
}
