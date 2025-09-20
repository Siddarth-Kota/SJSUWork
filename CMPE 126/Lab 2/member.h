#ifndef MEMBER_H
#define MEMBER_H

#include <iostream>
#include "length.h"

using namespace std;

class member {
    private:
        length height;
        double weight;
        int memberID;
    public:
        member(int id);

        void setHeight(int ft, int in);
        void setHeight(const length& h);
        void setWeight(double w);
        
        friend ostream& operator<<(ostream& out, const member& m);
};

#endif // MEMBER_H