#include <iostream>
#include "length.h"

using namespace std;

length::length() : feet(0), inches(0) {}
length::length(int ft) : feet(ft), inches(0) {}
length::length(int ft, int in) {
    int totalInches = ft * 12 + in;
    feet = totalInches / 12;
    inches = totalInches % 12;
}

void length::setFeet(int ft) {
    feet = ft;
}
void length::setInches(int in) {
    int totalInches = feet * 12 + in;
    feet = totalInches / 12;
    inches = totalInches % 12;
}

int length::getFeet() const {
    return feet;
}
int length::getInches() const {
    return inches;
}

length operator+(const length& len1, const length& len2) {
    length final;
    final.setInches((len1.getInches() + len2.getInches())%12);
    final.setFeet(len1.getFeet() + len2.getFeet() + ((len1.getInches() + len2.getInches())/12));
    return final;
}

length operator+(const length& len1, const int in) {
    length final;
    final.setInches((len1.getInches() + in)%12);
    final.setFeet(len1.getFeet() + ((len1.getInches() + in)/12));
    return final;
}

ostream& operator<<(ostream& out, const length& len) {
    out << len.getFeet() << " Feet " << len.getInches() << " Inches" << endl;
    return out;
}