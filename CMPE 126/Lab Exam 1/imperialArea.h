#ifndef IMPERIALAREA_H
#define IMPERIALAREA_H

#include <iostream>
#include <stdexcept>

using namespace std;

class imperialArea {
    private:
        int rood;
        int perch;
    public:
        imperialArea(int numRood, int numPerch);

        int getRood() const;
        int getPerch() const;

        friend ostream& operator<<(ostream& out, const imperialArea &arg);

        friend bool operator>(const imperialArea &num1, const imperialArea &num2);
        friend bool operator<(const imperialArea &num1, const imperialArea &num2);
        friend bool operator<=(const imperialArea &num1, const imperialArea &num2);
        friend bool operator>=(const imperialArea &num1, const imperialArea &num2);

        friend imperialArea operator+(const imperialArea &num1, const imperialArea &num2);
        friend imperialArea operator-(const imperialArea &num1, const imperialArea &num2);
};

#endif // IMPERIALAREA_H