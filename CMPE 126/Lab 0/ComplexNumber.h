#ifndef COMPLEXNUMBER_H
#define COMPLEXNUMBER_H

class ComplexNumber {
private:
    double real;
    double im;
public:
    ComplexNumber();
    ComplexNumber(double r, double i);

    void setReal(double r);
    void setIm(double i);

    double getModulus();
    void print();
};

#endif //COMPLEXNUMBER_H