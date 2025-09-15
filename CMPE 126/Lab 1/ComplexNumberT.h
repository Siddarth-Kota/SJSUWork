#ifndef COMPLEXNUMBERT_H
#define COMPLEXNUMBERT_H

#include <string>
#include <iostream>
#include <algorithm>

template <typename T = int> class complexNumberT {
    private:
        T val1;
        T val2;
    public:
        complexNumberT() : val1(0), val2(0) {}
        complexNumberT(T r) : val1(r), val2(0) {}
        complexNumberT(T r, T i) : val1(r), val2(i) {}

        void setReal(T r) {val1 = r;}
        void setImag(T i) {val2 = i;}

        T getReal() const {return val1;}
        T getImag() const {return val2;}

        double getModulus() const {
            return sqrt(val1 * val1 + val2 * val2);
        }

        friend complexNumberT operator-(const complexNumberT& num) {
            return {-num.val1, -num.val2};
        }

        friend complexNumberT operator+(const complexNumberT& a, const complexNumberT& b) {
            return {a.val1 + b.val1, a.val2 + b.val2};
        }

        friend complexNumberT operator-(const complexNumberT& a, const complexNumberT& b) {
            return {a.val1 - b.val1, a.val2 - b.val2};
        }

        friend complexNumberT operator*(const complexNumberT& a, const complexNumberT& b) {
            return {a.val1 * b.val1 - a.val2 * b.val2, a.val1 * b.val2 + a.val2 * b.val1};
        }

        friend ostream& operator<<(ostream& out, const complexNumberT& z) {
            out << "[" << z.val1 << ", " << z.val2 << "]";
            return out;
        }
};

#endif // COMPLEXNUMBERT_H