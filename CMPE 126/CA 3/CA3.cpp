#include <iostream>
using namespace std;

int fib(int n) {
    if (n <= 1) return n;
    return fib(n - 1) + fib(n - 2);
};

int decimalToBinary(int n) {
    if (n == 0) return 0;
    return n % 2 + 10 * decimalToBinary(n / 2);
};

int main() {
    int fibn = 4;
    cout << "The fibonacci sequence of " << fibn << " is " << fib(fibn) << endl;
    int dec = 5;
    cout << "The binary equivalent of " << dec << " is " << decimalToBinary(dec) << endl;

}

/* Output:
The fibonacci sequence of 4 is 3
The binary equivalent of 5 is 101
*/