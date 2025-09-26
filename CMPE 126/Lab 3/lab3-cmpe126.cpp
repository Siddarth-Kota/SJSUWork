#include "arrayList.h"
#include "ComplexNumber.h"
#include "ComplexNumber.cpp"

#include <iostream>
#include <string>

using namespace std;

int main() {
    arrayList<ComplexNumber> list(5);
    ComplexNumber num1(3, 4);
    ComplexNumber num2(1, -1);
    ComplexNumber num3(0, 2);
    ComplexNumber num4(5, 0);
    ComplexNumber num5(-2, -3);

    list.insertEnd(num1);
    list.insertEnd(num2);
    list.insertEnd(num3);
    list.insertEnd(num4);
    list.insertEnd(num5);

    cout << "List contents: ";
    list.print();
    cout << endl;

    cout << "Is the list full? " << (list.isFull() ? "Yes" : "No") << endl;
    cout << "List size: " << list.listSize() << endl;
    cout << "Max list size: " << list.maxListSize() << endl;

    cout << endl;
    ComplexNumber num6(3, 4);
    cout << "Is item at index 0 equal to (3 + 4i)? " 
         << (list.isItemAtEqual(0, num6) ? "Yes" : "No") << endl;
    list.removeAt(2);
    cout << "List after removing item at index 2: ";
    list.print();
    cout << endl;
    cout << "Is the list full? " << (list.isFull() ? "Yes" : "No") << endl;
    cout << "Item at index 1: " << list.retrieveAt(1) << endl;


    ComplexNumber num7(7, 8);
    list.replaceAt(1, num7);
    cout << "List after replacing item at index 1 with (7 + 8i): ";
    list.print();
    cout << endl;

    ComplexNumber num8(6, -2);
    list.insertAt(1, num8);
    cout << "List after inserting (6 - 2i) at index 1: ";
    list.print();
    cout << endl;

    list.clearList();
    cout << "List after clearing: ";
    list.print();
    cout << "Is the list empty? " << (list.isEmpty() ? "Yes" : "No") << endl;
    cout << endl;

    arrayList<ComplexNumber> list2(3);
    list2.insertEnd(ComplexNumber(1, 1));
    list2.insertEnd(ComplexNumber(2, 2));
    list2.insertEnd(ComplexNumber(3, 3));

    list = list2;
    cout << "List after assignment from another list: ";
    list.print();
    cout << endl;


    return 0;
}