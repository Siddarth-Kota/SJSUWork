#include "EntryLog.h"
#include "Time.h"
#include "member.h"
#include <iostream>

using namespace std;

EntryLog::EntryLog() : m(0), timeIn(0,0), timeOut(0,0) {}

void EntryLog::setMember(const member& mem) {
    m = mem;
}

void EntryLog::setTimeIn(const Time& in) {
    timeIn = in;
}

void EntryLog::setTimeOut(const Time& out) {
    timeOut = out;
}

EntryLog operator+(const EntryLog& log1, const int min) {
    EntryLog newLog = log1;
    newLog.setTimeOut(log1.timeOut + min);
    return newLog;
}

ostream& operator<<(ostream& out, const EntryLog& log) {
    out << "Entry Log:" << endl;
    out << log.m;
    out << "Time In: " << log.timeIn;
    out << "Time Out: " << log.timeOut;
    return out;
}