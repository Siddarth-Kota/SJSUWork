#include "imperialArea.h"

using namespace std;

#include <iostream>
#include <stdexcept>

imperialArea::imperialArea(int numRood, int numPerch) {
    if(numRood < 0 || numPerch < 0) {
        throw invalid_argument("Invalid negative values");
    }
    //I was told to correct the values instead of throwing an Error during the Exam
    perch = numPerch % 40;
    rood = numRood + (numPerch/40);
    /* Optional Code to throw error instead:
    if(numPerch > 39) {
        throw invalid_argument("Perch value cannot exceed 39");
    }
    */
}

int imperialArea::getRood() const {
    return rood;
}

int imperialArea::getPerch() const {
    return perch;
}

ostream& operator<<(ostream& out, const imperialArea &arg) {
    out << arg.rood << " rood, " << arg.perch << " sq perch";
    return out;
}

bool operator>(const imperialArea &num1, const imperialArea &num2) {
    if(num1.rood > num2.rood) {return true;} 
    else if(num1.rood == num2.rood && num1.perch > num2.perch) {return true;} 
    else {return false;}
}

bool operator<(const imperialArea &num1, const imperialArea &num2) {
    if(num1.rood < num2.rood) {return true;} 
    else if(num1.rood == num2.rood && num1.perch < num2.perch) {return true;} 
    else {return false;}
}

bool operator<=(const imperialArea &num1, const imperialArea &num2) {
    if(num1.rood < num2.rood) {return true;} 
    else if(num1.rood == num2.rood && num1.perch <= num2.perch) {return true;} 
    else {return false;}
}

bool operator>=(const imperialArea &num1, const imperialArea &num2) {
    if(num1.rood > num2.rood) {return true;} 
    else if(num1.rood == num2.rood && num1.perch >= num2.perch) {return true;} 
    else {return false;}
}

imperialArea operator+(const imperialArea &num1, const imperialArea &num2) {
    return imperialArea(num1.rood + num2.rood, num1.perch + num2.perch);
}

imperialArea operator-(const imperialArea &num1, const imperialArea &num2) {
    if(num1 < num2) {
        throw invalid_argument("Resulting area cannot be negative");
    }
    int totalPerch1 = num1.rood * 40 + num1.perch;
    int totalPerch2 = num2.rood * 40 + num2.perch;
    int diffPerch = totalPerch1 - totalPerch2;
    return imperialArea(diffPerch / 40, diffPerch % 40);
}