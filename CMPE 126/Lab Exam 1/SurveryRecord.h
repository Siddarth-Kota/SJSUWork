#ifndef SURVERYRECORD_H
#define SURVERYRECORD_H

#include <iostream>
#include <stdexcept>
#include <string>
#include <iomanip>

#include "imperialArea.h"

using namespace std;

class SurveryRecord {
    private:
        string description;
        imperialArea area;
    public:
        SurveryRecord(string desc, imperialArea val);
        SurveryRecord();

        string getDescription() const {return description;}
        imperialArea getArea() const {return area;}

        friend ostream& operator<<(ostream& out, const SurveryRecord &arg);
        friend istream& operator>>(istream& in, SurveryRecord &arg);
        SurveryRecord operator=(const SurveryRecord &arg);


        //Algorithms
        SurveryRecord smallestArea(SurveryRecord arr[], int size);
        SurveryRecord largestArea(SurveryRecord arr[], int size);
        SurveryRecord averageArea(SurveryRecord arr[], int size);
};



#endif // SURVERYRECORD_H