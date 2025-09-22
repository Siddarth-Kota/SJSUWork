#include "member.h"
#include "length.h"
#include <iostream>

using namespace std;

member::member(int id) : memberID(id), weight(0), height(0,0) {}

void member::setHeight(int ft, int in) {
    height.setFeet(ft);
    height.setInches(in);
}

void member::setHeight(const length& h) {
    height = h;
}

void member::setWeight(double w) {
    weight = w;
}

ostream& operator<<(ostream& out, const member& m) {
    out << "Member ID: " << m.memberID << endl;
    out << "Height: " << m.height;
    out << "Weight: " << m.weight << " lbs" << endl;
    return out;
}
