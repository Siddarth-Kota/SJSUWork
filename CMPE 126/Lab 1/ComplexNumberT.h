#ifndef COMPLEXNUMBERT_H
#define COMPLEXNUMBERT_H

#include <string>
#include <algorithm>



template <typename t = int> class complexNumberT {
private:
    T real;
    T im;
public:
    complexNumberT() : real(0), imag(0) {}
    complexNumberT(T r) : real(r), imag(0) {}
    complexNumberT(T r, T i) : real(r), imag(i) {}

    void setReal(T r) {real = r;}
    void setImag(T i) {im = i;}

    T getReal() const {return real;}
    T getImag() const {return im;

    double getModulus() const {
        return sqrt(real * real + im * im);
    }

    friend complexNumberT operator-(const complexNumberT& num) {
        return {-num.real, -num.im};
    }

    friend complexNumberT operator+(const complexNumberT& a, const complexNumberT& b) {
        return {a.real + b.real, a.im + b.im};
    }

    friend complexNumberT operator-(const complexNumberT& a, const complexNumberT& b) {
        return {a.real - b.real, a.im - b.im};
    }

    friend complexNumberT operator*(const complexNumberT& a, const complexNumberT& b) {
        return {a.real * b.real - a.im * b.im, a.real * b.im + a.im * b.real};
    }

    friend ostream& operator<<(ostream& out, const complexNumberT& z) {
        out << z.real << (z.im < 0 ? "" : "+") << z.im << "i";
        return os;
    }

    friend std::istream& operator>>(std::istream& is, complexNumberT& z) {
        std::string raw;
        if (!std::getline(is >> std::ws, raw)) return is;
        raw.erase(std::remove_if(raw.begin(), raw.end(),
                                 [](unsigned char c){ return std::isspace(c); }),
                  raw.end());
        static const std::regex AplusBi(R"(^([+-]?\d+(?:\.\d+)?)(?:([+-])(\d+(?:\.\d+)?))i$)");
        static const std::regex onlyA  (R"(^([+-]?\d+(?:\.\d+)?)$)");
        static const std::regex onlyBi (R"(^([+-]?\d+(?:\.\d+)?)i$)");
        std::smatch m;
        auto toT = [](const std::string& s){ long double v = std::stold(s); return static_cast<T>(v); };

        if (std::regex_match(raw, m, AplusBi)) {
            T a = toT(m[1].str());
            T b = toT(m[3].str());
            if (m[2].str() == "-") b = -b;
            z.real = a; z.im = b; return is;
        }
        if (std::regex_match(raw, m, onlyA)) {
            z.real = toT(m[1].str()); z.im = T(0); return is;
        }
        if (std::regex_match(raw, m, onlyBi)) {
            z.real = T(0); z.im = toT(m[1].str()); return is;
        }
        is.setstate(std::ios::failbit);
        return is;
    }
};

#endif // COMPLEXNUMBERT_H