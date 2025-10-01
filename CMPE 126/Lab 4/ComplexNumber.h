#ifndef COMPLEXNUMBER_H
#define COMPLEXNUMBER_H

#include <string>

using namespace std;

class ComplexNumber {
private:
    double real;
    double im;
public:
    ComplexNumber();
    ComplexNumber(double r);
    ComplexNumber(double r, double i);

    void setReal(double r);
    void setIm(double i);

    double getReal() const;
    double getIm() const;

    double getModulus() const;
    void print() const;

    friend ComplexNumber operator-(const ComplexNumber &num);
    friend ComplexNumber operator+(const ComplexNumber &num1, const ComplexNumber &num2);
    friend ComplexNumber operator-(const ComplexNumber &num1, const ComplexNumber &num2);
    friend ComplexNumber operator*(const ComplexNumber &num1, const ComplexNumber &num2);
    friend bool operator<(const ComplexNumber &num1, const ComplexNumber &num2);

    friend ostream& operator<<(ostream& out, const ComplexNumber &num);
    friend istream& operator>>(istream& in, ComplexNumber &num);

    friend bool operator==(const ComplexNumber &num1, const ComplexNumber &num2);
};

#endif //COMPLEXNUMBER_H