#include <iostream>
#include <cmath>
#include <cctype>
#include <string>
#include <algorithm>

#include "ComplexNumber.h"

using namespace std;

ComplexNumber::ComplexNumber() : real(0.0), im(0.0) {}
ComplexNumber::ComplexNumber(double r) : real(r), im(0.0) {}
ComplexNumber::ComplexNumber(double r, double i) : real(r), im(i) {}

void ComplexNumber::setReal(double r) {real = r;}
void ComplexNumber::setIm(double i) {im = i;}
double ComplexNumber::getReal() const {return real;}
double ComplexNumber::getIm() const {return im;}

double ComplexNumber::getModulus() const {
    return sqrt((real * real) + (im * im));
}

void ComplexNumber::print() const {
    if(real != 0) {
        cout << real;
    }
    if(im < 0) {
        cout << " - ";
    }
    else if(im > 0) {
        cout << " + ";
    }
    if(im != 0) {
        cout << "i" << abs(im);
    }
    //cout << "\n";
}

ComplexNumber operator-(const ComplexNumber &num) {
    return ComplexNumber(-num.real, -num.im);
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

bool operator<(const ComplexNumber& lhs, const ComplexNumber& rhs) {
    if (lhs.getReal() == rhs.getReal())
        return lhs.getIm() < rhs.getIm();
    return lhs.getReal() < rhs.getReal();
}

ostream& operator<<(ostream& out, const ComplexNumber &num) {
    if((num.real != 0) || (num.im == 0 && num.real == 0)) {out << num.real;}
    if(num.im < 0) {out << num.im << "i";}
    else if(num.im > 0) {
        if (num.real != 0) {out << "+";}
        out << num.im << "i";
    }
    //out << endl;
    return out;
}

istream& operator>>(istream& in, ComplexNumber &num) {
    string val = "";
    in >> ws;
    getline(in, val);
    val.erase(std::remove(val.begin(), val.end(), ' '), val.end());
    //cout << val << endl;
    int sep = max((int)val.find("+",1), (int)val.find("-",1));
    if(sep != -1) {
        string sreal = val.substr(0,sep);
        //cout << sreal << endl;
        num.real = stod(sreal);
        //cout << num.real << endl;
        string sim = val.substr(sep, val.length());
        //cout << sim.substr(0,sim.find("i")) <<endl;
        num.im = stod(sim.substr(0,sim.find("i")));
    }
    else if((int)val.find("i") != -1) {
        //cout << val.substr(0,val.find("i")) << endl;
        num.real = 0.0;
        num.im = stod(val.substr(0,val.find("i")));
    }
    else {
        //cout << val;
        try {
            num.real = stod(val);
            num.im = 0.0;
        }
        catch(invalid_argument &e) {
            in.setstate(ios::failbit);
        }
    }
    return in;
}

bool operator==(const ComplexNumber &num1, const ComplexNumber &num2) {
    return (num1.real == num2.real) && (num1.im == num2.im);
}