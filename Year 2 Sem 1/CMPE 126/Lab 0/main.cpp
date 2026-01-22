#include <iostream>
#include "ComplexNumber.h"

using namespace std;

int main() {
    ComplexNumber z1(3.0,4.0);
    ComplexNumber z2(3.0,0.0);
    ComplexNumber z3;

    z3.setReal(2.0);
    z3.setIm(-3.3);

    cout << z1.getModulus() << endl;
    z1.print();
    z2.print();
    z3.print();
    return 0;
}