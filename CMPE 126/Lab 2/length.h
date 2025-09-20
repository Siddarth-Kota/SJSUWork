#ifndef LENGTH_H
#define LENGTH_H

#include <iostream>

using namespace std;

class Length {
private:
    int feet;
    int inches;
public:
    Length();
    Length(int ft);
    Length(int ft, int in);

    void setFeet(int ft);
    void setInches(int in);

    int getFeet() const;
    int getInches() const;

    friend Length operator+(const Length& len1, const Length& len2);
    friend Length operator+(const Length& len1, const int num);
    
    friend ostream& operator<<(std::ostream& os, const Length& len);
};

#endif // LENGTH_H