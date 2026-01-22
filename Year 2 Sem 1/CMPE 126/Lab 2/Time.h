#ifndef TIME_H
#define TIME_H

#include <iostream>

using namespace std;

class Time {
    private:
        int hour;
        int minute;
    public:
        Time();
        Time(int hr);
        Time(int hr, int min);

        int getHour() const;
        int getMinute() const;
        
        void setHour(int hr);
        void setMinute(int min);

        friend Time operator+(const Time& t1, const int min);
        friend ostream& operator<<(ostream& out, const Time& t);
};


#endif // TIME_H