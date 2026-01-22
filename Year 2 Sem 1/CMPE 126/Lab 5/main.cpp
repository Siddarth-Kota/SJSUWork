#include "arrayList.h"
#include "linkedList.h"
#include "palindrome.cpp"
#include "Padovan.cpp"
#include <iostream>

using namespace std;

int main() {
    cout << "Padovan Tests:\n" << endl;
    padovan(7);

    cout << "\nPalindrome Tests:\n" << endl;

    int tests[] = {1234321, 12321, 1221, 12345, 11, 1, 0, -121, 10};
	for (int v : tests) {
		cout << v << " is " << (check_palindrome(v) ? "" : "not ") << "a palindrome" << endl;
	}

    cout << "\nMinimum Element Tests:\n" << endl;

    arrayList<int> a(10);
    a.insertEnd(5);
    a.insertEnd(3);
    a.insertEnd(8);
    a.insertEnd(1);

    cout << "ArrayList min: " << a.getMinRecursive() << endl;

    LinkedList<int> l(10);
    l.insertEnd(7);
    l.insertEnd(2);
    l.insertEnd(9);
    l.insertEnd(4);

    cout << "LinkedList min: " << l.getMinRecursive() << endl;

    return 0;
}