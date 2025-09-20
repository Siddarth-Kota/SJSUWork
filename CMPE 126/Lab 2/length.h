#ifndef LENGTH_H
#define LENGTH_H

#include <iostream>

using namespace std;

class length {
    private:
        int feet;
        int inches;
    public:
        length();
        length(int ft);
        length(int ft, int in);

        void setFeet(int ft);
        void setInches(int in);

        int getFeet() const;
        int getInches() const;

        friend length operator+(const length& len1, const length& len2);
        friend length operator+(const length& len1, const int in);
        
        friend ostream& operator<<(ostream& out, const length& len);
};

#endif // LENGTH_H