#include <iostream>
using namespace std;


//Task 1 Part 2
unsigned int padovan(const unsigned int &n) {
    cout << "In padovan with n = " << n << endl;
    
    // Base cases: P(0) = P(1) = P(2) = 1
    if (n == 0 || n == 1 || n == 2) {
        cout << "Returning 1 with n = " << n << endl;
        return 1;
    }
    
    // Recursive case: P(n) = P(n-2) + P(n-3)
    unsigned int result = padovan(n-2) + padovan(n-3);
    cout << "Returning " << result << " with n = " << n << endl;
    return result;
}

int main() {
    padovan(7);
    return 0;
}
