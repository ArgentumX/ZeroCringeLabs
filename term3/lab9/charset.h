#include <string>

class CharSet
{
public:
    const static int DOWN_BORDER = 33;
    const static int UP_BORDER = 126;
    const static int CAPACITY = UP_BORDER - DOWN_BORDER + 1;

private:
    bool *table;

private:
    static int getAsciiIdByTableId(int id);
    static int getTableIdByAsciiId(int id);

public:
    static bool isPossibleChar(char s);
    CharSet(std::string s = "");
    CharSet(const CharSet &from, int k = UP_BORDER);
    ~CharSet();
    CharSet(char s);
    operator char();
    operator std::string();
    int getSize() const;
    bool contains(char s) const;
    void add(char s);
    void remove(char s);
};