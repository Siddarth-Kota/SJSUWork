#include <iostream>
#include <fstream>
#include "ComplexNumber.h"
#include "ComplexNumber.cpp"
#include "ComplexNumberT.h"

using namespace std;

int main() {
    
    //[LP]
    cout << "LP" << endl;
    ComplexNumber c1;
    ComplexNumber c2(1,-5);
    ComplexNumber c3(2);
    ComplexNumber test(2,3);
    int realNum = 3;
    cout << c1;
    cout << c2 << "" << c3;
    cout << c2 + c3;
    c1 = c1+realNum;
    cin >> c2;
    cout << c2*c3;
    c3 = c2-c1;
    cout << c3;

    //[HP]
    cout << "\nHP" << endl;
    ifstream inFile("ComplexInput.txt");
    ofstream outFile("ComplexOutput.txt");
    if(!inFile || !outFile) {
        cout << "error" << endl;
        return 1;
    }

    ComplexNumber a;
    ComplexNumber b;
    char op;

    if(!(inFile >> a)) {
        outFile << "ERROR: First Line not in a+bi format" << endl;
        return 1;
    }
    cout << a;;
    if(!(inFile >> op) || op != '+' && op != '-' && op != '*') {
        outFile << "ERROR: Second Line contains an Invalid Operator" << endl;
        return 1;
    }
    if(!(inFile >> b)) {
        outFile << "ERROR: Third Line not in a+bi format" << endl;
        return 1;
    }
    cout << b;

    ComplexNumber result;
    switch (op) {
        case '+': result = a + b; break;
        case '-': result = a - b; break;
        case '*': result = a * b; break;
    }
    cout << result << endl;
    outFile << result << endl;

    return 0;
}