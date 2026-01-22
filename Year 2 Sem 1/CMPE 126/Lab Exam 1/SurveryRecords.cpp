#include "SurveryRecord.h"

#include <iostream>
#include <stdexcept>
#include <string>

using namespace std;

SurveryRecord::SurveryRecord(string desc, imperialArea val) : description(desc), area(val) {
    if(desc.empty()) {
        throw invalid_argument("Description cannot be empty");
    }
}

SurveryRecord::SurveryRecord() : description(""), area(imperialArea(0,0)) {}

ostream& operator<<(ostream& out, const SurveryRecord &arg) {
   out << arg.area << ", " << arg.description << endl;
   return out;
}

istream& operator>>(istream& in, SurveryRecord &arg) {
    string val = "";
    in >> ws;
    getline(in, val);
    if(val.empty()) {
        throw invalid_argument("Description cannot be empty");
    }
    string area = val.substr(0, val.find_last_of(","));
    string desc = val.substr(val.find_last_of(",") + 2);
    try{
        int rood = stoi(area.substr(0, area.find(" ")));
        int perch = stoi(area.substr(area.find(" ") + 6, area.find("s") - area.find(" ") - 6));
        //cout << "Rood: " << rood << " Perch: " << perch << endl;
        arg.area = imperialArea(rood, perch);
        //cout << arg.area << endl;
        arg.description = desc;
        //cout << "Description: " << desc << endl;
        //cout << arg << endl;
    }
    catch(invalid_argument &e) {
        throw invalid_argument("Invalid input format");
    }
    return in;
}

SurveryRecord SurveryRecord::operator=(const SurveryRecord &arg) {
    if(this != &arg) {
        description = arg.description;
        area = arg.area;
    }
    return *this;
}

//Algorithms
SurveryRecord SurveryRecord::smallestArea(SurveryRecord arr[], int size) {
    SurveryRecord smallest = arr[0];
    for(int i = 1; i < size; i++) {
        if(arr[i].area < smallest.area) {
            smallest = arr[i];
        }
    }
    return smallest;
}

SurveryRecord SurveryRecord::largestArea(SurveryRecord arr[], int size) {
    SurveryRecord largest = arr[0];
    for(int i = 1; i < size; i++) {
        if(arr[i].area > largest.area) {
            largest = arr[i];
        }
    }
    return largest;
}

SurveryRecord SurveryRecord::averageArea(SurveryRecord arr[], int size) {
    int totalPerch = 0;
    for(int i = 0; i < size; i++) {
        totalPerch += arr[i].area.getRood() * 40 + arr[i].area.getPerch();
    }
    return SurveryRecord("Average Area", imperialArea(totalPerch / size / 40, totalPerch / size % 40));
}