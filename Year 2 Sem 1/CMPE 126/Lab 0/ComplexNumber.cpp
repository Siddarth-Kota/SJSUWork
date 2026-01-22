#include <iostream>
#include <cmath>
#include "ComplexNumber.h"
using namespace std;

ComplexNumber::ComplexNumber() : real(0.0), im(0.0) {}
ComplexNumber::ComplexNumber(double r, double i) : real(r), im(i) {}

void ComplexNumber::setReal(double r) {real = r;}
void ComplexNumber::setIm(double i) {im = i;}

double ComplexNumber::getModulus() {
    return sqrt((real * real) + (im * im));
}

void ComplexNumber::print() {
    if(real != 0) {
        cout << real;
    }
    if(im < 0) {
        cout << " + -";
    }
    else if(im > 0) {
        cout << " + ";
    }
    if(im != 0) {
        cout << "i" << abs(im);
    }
    cout << "\n";
}