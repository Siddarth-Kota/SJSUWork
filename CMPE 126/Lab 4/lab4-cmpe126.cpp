#include "linkedList.h"
#include <iostream>

using namespace std;

int main() {
    LinkedList<int> list(5);
    cout << "List created. Is empty: " << list.isEmpty() << ", Is full: " << list.isFull() << endl;

    list.insertAt(0, 10);
    list.insertAt(1, 20);
    list.insertAt(2, 30);
    cout << "After inserting 3 items:" << endl;
    list.print();

    cout << "Item at index 1: " << list.retreiveAt(1) << endl;

    list.replaceAt(1, 25);
    cout << "After replacing item at index 1 with 25:" << endl;
    list.print();

    cout << "Is item at index 1 equal to 25? " << (list.isItemAtEqual(1, 25) ? "Yes" : "No") << endl;

    list.removeAt(0);
    cout << "After removing item at index 0:" << endl;
    list.print();

    cout << "Current size: " << list.listSize() << ", Max size: " << list.maxListSize() << endl;

    return 0;
}