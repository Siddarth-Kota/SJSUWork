#include "linkedList.h"
#include "sortedLinkedList.h"
#include "ComplexNumber.h"
#include "ComplexNumber.cpp"
#include <iostream>

using namespace std;

int main() {

/* Testing Code using INT
    //Part 1: Testing LinkedList
    LinkedList<int> list(5);
    cout << "List created. Is empty: " << list.isEmpty() << ", Is full: " << list.isFull() << endl;

    list.insertAt(0, 10);
    list.insertAt(1, 90);
    list.insertEnd(20);
    list.insertEnd(30);
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
    LinkedList<int> list2(3, 5);
    cout << "New list created with initial item 5:" << endl;
    list2.print();
    cout << "clearing the new list." << endl;
    list2.clearList();
    list2.print();
    list2 = list;
    cout << "After assigning first list to second list:" << endl;
    list2.print();
    list.insertEnd(25);

    //Part 2: Testing SortedLinkedList
    SortedLinkedList<int> sortedList(5);
    cout << "\nSorted List created. Is empty: " << sortedList.isEmpty() << ", Is full: " << sortedList.isFull() << endl;
    sortedList.insert(50);
    sortedList.insert(20);
    sortedList.insert(30);
    sortedList.insert(30);
    sortedList.insert(10);
    cout << "After inserting 4 items:" << endl;
    sortedList.print();
    cout << "Is 20 in the list? " << (sortedList.isItemInList(20) ? "Yes" : "No") << endl;
    cout << "Is 40 in the list? " << (sortedList.isItemInList(40) ? "Yes" : "No") << endl;
    sortedList.remove(20);
    cout << "After removing 20:" << endl;
    sortedList.print();
    cout << "Current size: " << sortedList.listSize() << ", Max size: " << sortedList.maxListSize() << endl;
    SortedLinkedList<int> sortedList2 = sortedList;
    cout << "New sorted list created by copying the first sorted list:" << endl;
    sortedList2.print();
    cout << "Clearing the new sorted list." << endl;
    sortedList2.clearList();
    sortedList2.print();
    cout << "Creating another sorted list from a regular linked list." << endl;
    SortedLinkedList<int> sortedList3(list);
    cout << "Original regular list:" << endl;
    list.print();
    cout << "New sorted list created from the regular list:" << endl;
    sortedList3.print();
*/

    //Testing Code using ComplexNumber
        //Part 1: Testing LinkedList
    LinkedList<ComplexNumber> list(5);
    cout << "List created. Is empty: " << list.isEmpty() << ", Is full: " << list.isFull() << endl;

    list.insertAt(0, ComplexNumber(1, 2));
    list.insertAt(1, ComplexNumber(3, 4));
    list.insertEnd(ComplexNumber(5, 6));
    list.insertEnd(ComplexNumber(7, 8));
    cout << "After inserting 4 items:" << endl;
    list.print();

    cout << "Item at index 1: " << list.retreiveAt(1) << endl;

    list.replaceAt(1, ComplexNumber(25, -2));
    cout << "After replacing item at index 1 with 25:" << endl;
    list.print();

    cout << "Is item at index 1 equal to 25? " << (list.isItemAtEqual(1, ComplexNumber(25, -2)) ? "Yes" : "No") << endl;

    list.removeAt(0);
    cout << "After removing item at index 0:" << endl;
    list.print();

    cout << "Current size: " << list.listSize() << ", Max size: " << list.maxListSize() << endl;
    LinkedList<ComplexNumber> list2(3, ComplexNumber(5, 0));
    cout << "New list created with initial item 5:" << endl;
    list2.print();
    cout << "clearing the new list." << endl;
    list2.clearList();
    list2.print();
    list2 = list;
    cout << "After assigning first list to second list:" << endl;
    list2.print();
    list.insertEnd(ComplexNumber(25, -2));

    //Part 2: Testing SortedLinkedList
    SortedLinkedList<ComplexNumber> sortedList(5);
    cout << "\nSorted List created. Is empty: " << sortedList.isEmpty() << ", Is full: " << sortedList.isFull() << endl;
    sortedList.insert(ComplexNumber(50, 2));
    sortedList.insert(ComplexNumber(20, 4));
    sortedList.insert(ComplexNumber(30, 10));
    sortedList.insert(ComplexNumber(30, 0));
    sortedList.insert(ComplexNumber(10, -3));
    cout << "After inserting 4 items:" << endl;
    sortedList.print();
    cout << "Is 20 in the list? " << (sortedList.isItemInList(ComplexNumber(20, 4)) ? "Yes" : "No") << endl;
    cout << "Is 40 in the list? " << (sortedList.isItemInList(ComplexNumber(40, -3)) ? "Yes" : "No") << endl;
    sortedList.remove(ComplexNumber(20, 4));
    cout << "After removing 20:" << endl;
    sortedList.print();
    cout << "Current size: " << sortedList.listSize() << ", Max size: " << sortedList.maxListSize() << endl;
    SortedLinkedList<ComplexNumber> sortedList2 = sortedList;
    cout << "New sorted list created by copying the first sorted list:" << endl;
    sortedList2.print();
    cout << "Clearing the new sorted list." << endl;
    sortedList2.clearList();
    sortedList2.print();
    cout << "Creating another sorted list from a regular linked list." << endl;
    SortedLinkedList<ComplexNumber> sortedList3(list);
    cout << "Original regular list:" << endl;
    list.print();
    cout << "New sorted list created from the regular list:" << endl;
    sortedList3.print();

    return 0;
}