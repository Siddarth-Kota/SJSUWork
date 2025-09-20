#include <iostream>
#include "length.h"
#include "member.h"
#include "Time.h"
#include "EntryLog.h"

#include "length.cpp"
#include "member.cpp"
#include "Time.cpp"
#include "EntryLog.cpp"

using namespace std;

int main() {
    //Task 1
    cout << "\nTask 1\n" << endl;
    length h1; //h1 initialized to 0 feet 0 inches
    length h2 (3); //h2 initialized to 3 feet 0 inches
    length h3 (5,10); //h3 initialized to 5 feet 10 inches
    int inches = 10;
    cout << h1;
    cout << h2 << h3;
    cout << h2+h3;
    h1 = h3+inches;
    cout << h1;

    //task 2
    cout << "\nTask 2\n" << endl;
    int memberID = 1000;
    member m1(memberID); //Note that there should be no default value of memberID
    m1.setHeight(5, 7); //Sets the height field to 5 feet and 7 inches
    m1.setWeight(150); //Sets the weight field to 150lbs;
    cout << m1; //Outputs member information in a suitable format
    length h(6, 2);
    m1.setHeight(h); //Sets the height field to values from h
    cout << m1;

    //task 3
    cout << "\nTask 3\n" << endl;
    Time t1; //t1 initialized to 0 hour 0 minute, i.e., 12:00
    Time t2 (3); //t2 initialized to 3 hour 0 minute, i.e., 03:00
    Time t3 (5,10); //t3 initialized to 5 hour 10 minute, i.e., 05:10
    int minute = 10;
    cout << t1;
    cout << t2 << t3;

    //task 4
    cout << "\nTask 4\n" << endl;
    EntryLog log;
    log.setMember(m1);
    Time timeIn (10,15);
    Time timeOut = timeIn + 90;
    log.setTimeIn(timeIn);
    log.setTimeOut(timeOut);
    cout << log;
}