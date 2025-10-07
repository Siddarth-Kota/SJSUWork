#include "imperialArea.h"
#include "imperialArea.cpp"
#include "SurveryRecord.h"
#include "SurveryRecords.cpp"

#include <iostream>
#include <stdexcept>
#include <fstream>


using namespace std;

int main() {

    // Test cases for imperialArea class (1 - 4)
    cout << "imperialArea comparison test (1 - 4):" << endl;
    imperialArea area1(2, 20);
    imperialArea area2(3, 10);
    imperialArea area3(2, 50);
    imperialArea area4(1, 80);
    imperialArea area5(2, 20);

    cout << "   Area 1: " << area1 << endl;
    cout << "   Area 2: " << area2 << endl;
    cout << "   Area 3: " << area3 << endl;
    cout << "   Area 4: " << area4 << endl;
    cout << "   Area 5: " << area5 << endl;

    cout << "\n   Area 1 > Area 2: " << (area1 > area2 ? "True" : "False") << endl;
    cout << "   Area 1 < Area 2: " << (area1 < area2 ? "True" : "False") << endl;
    cout << "   Area 1 <= Area 5: " << (area1 <= area5 ? "True" : "False") << endl;
    cout << "   Area 1 >= Area 5: " << (area1 >= area5 ? "True" : "False") << endl;
    cout << "   Area 2 >= Area 3: " << (area2 >= area3 ? "True" : "False") << endl;
    cout << "   Area 3 > Area 4: " << (area3 > area4 ? "True" : "False") << endl;
    cout << "   Area 4 < Area 3: " << (area4 < area3 ? "True" : "False") << endl;

    //Test cases for SurveryRecord class (5)
    cout << "\nSurveryRecord Test (5):" << endl;

    SurveryRecord test("Test Description", imperialArea(1, 50));
    cout << "   " << test << endl;

    //Test Cases for Add and Subtract for imperialArea class (6)
    cout << "Addition and Subtraction (6):" << endl;
    cout << "   Area 1: " << area1 << endl;
    cout << "   Area 2: " << area2 << endl;
    imperialArea sum = area1 + area2;
    imperialArea diff = area2 - area1;

    cout << "\n   Sum: " << sum << endl;
    cout << "   Difference: " << diff << endl;

    //Algorithm Test Cases (7)
    cout << "\nAlgorithm Test cases(7):" << endl;
    SurveryRecord record;

    ifstream file("survey_assignment.txt");
    if(!file) {
        cout << "Error opening file" << endl;
        return 1;
    }

    int size;
    file >> size;

    SurveryRecord vals[size];

    for(int i = 0; i < size; i++) {
        try {
            file >> record;
            cout << "   " << record;
            vals[i] = record;
        }
        catch(invalid_argument &e) {
            cout << "error reading line " << i + 2 << endl;
        }
    }

    cout << "\n   Smallest Area (from survery_assignment.txt): " << record.smallestArea(vals, size);
    cout << "   Largest Area (from survery_assignment.txt): " << record.largestArea(vals, size);
    cout << "   Average Area (from survery_assignment.txt): " << record.averageArea(vals, size);
    
    file.close();

    return 0;
}