#ifndef ENTRYLOG_H
#define ENTRYLOG_H

#include <iostream>
#include "member.h"
#include "Time.h"

using namespace std;

class EntryLog {
    private:
        member m;
        Time timeIn;
        Time timeOut;
    public:
        EntryLog();
        void setMember(const member& mem);
        void setTimeIn(const Time& in);
        void setTimeOut(const Time& out);

        friend EntryLog operator+(const EntryLog& log1, const int min);
        friend ostream& operator<<(ostream& out, const EntryLog& log);
};

#endif // ENTRYLOG_H