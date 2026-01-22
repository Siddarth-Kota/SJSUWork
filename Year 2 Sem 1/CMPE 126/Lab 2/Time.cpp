#include "Time.h"
#include <iostream>

using namespace std;

Time::Time() : hour(0), minute(0) {}
Time::Time(int hr) : hour(hr % 24), minute(0) {}
Time::Time(int hr, int min) {
    int totalMinutes = hr * 60 + min;
    hour = (totalMinutes / 60) % 24;
    minute = totalMinutes % 60;
}

int Time::getHour() const {
    return hour;
}
int Time::getMinute() const {
    return minute;
}

void Time::setHour(int hr) {
    hour = hr % 24;
}
void Time::setMinute(int min) {
    int totalMinutes = hour * 60 + min;
    hour = (totalMinutes / 60) % 24;
    minute = totalMinutes % 60;
}

Time operator+(const Time& t1, const int min) {
    Time final;
    int totalMinutes = t1.getHour() * 60 + t1.getMinute() + min;
    final.setHour((totalMinutes / 60) % 24);
    final.setMinute(totalMinutes % 60);
    return final;
}

ostream& operator<<(ostream& out, const Time& t) {
    out << (t.hour < 10 ? "0" : "") << t.hour << ":"
        << (t.minute < 10 ? "0" : "") << t.minute << endl;
    return out;
}