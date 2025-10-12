#include <iostream>
#include <cmath>
using namespace std;

// Helper function to get the number of digits
int getLength(int number) {
    if (number == 0) return 1;
    int count = 0;
    while (number > 0) {
        count++;
        number /= 10;
    }
    return count;
}

// Recursive function to check if a number is palindrome
bool isPalindrome(const int &number, int start, int end) {
    // Base case: single digit or no more digits to compare
    if (start >= end) {
        return true;
    }
    
    // Get first digit
    int firstDigit = (number / static_cast<int>(pow(10, end))) % 10;
    
    // Get last digit
    int lastDigit = (number / static_cast<int>(pow(10, start))) % 10;
    
    // If digits don't match, not a palindrome
    if (firstDigit != lastDigit) {
        return false;
    }
    
    // Recursive case: check next pair of digits
    return isPalindrome(number, start + 1, end - 1);
}

// Main palindrome check function
bool check_palindrome(const int &n) {
    // Handle negative numbers
    if (n < 0) return false;
    
    int length = getLength(n);
    return isPalindrome(n, 0, length - 1);
}

int main() {
    // Test cases
    int test_cases[] = {1234321, 12321, 1221, 12345, 11, 1, 0, 123};
    
    for (int num : test_cases) {
        cout << num << " is " << (check_palindrome(num) ? "" : "not ")
             << "a palindrome" << endl;
    }
    
    return 0;
}
