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

ComplexNumber operator+(const ComplexNumber &num1, const ComplexNumber &num2) {
    return ComplexNumber(num1.real + num2.real, num1.im + num2.im);
}

ComplexNumber operator-(const ComplexNumber &num1, const ComplexNumber &num2) {
    return ComplexNumber(num1.real - num2.real, num1.im - num2.im);
}

ComplexNumber operator*(const ComplexNumber &num1, const ComplexNumber &num2) {
    double real = num1.real * num2.real - num1.im * num2.im;
    double im = num1.real * num2.im + num1.im * num2.real;
    return ComplexNumber(real,im);
}

ostream& operator<<(ostream& out, const ComplexNumber &num) {
    out << num.real;
    if(num.im < 0) {
        out << num.im << "i";
    }
    else {
        out << "+" << num.im << "i";
    }
    return out;
}