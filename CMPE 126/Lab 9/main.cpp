//============================================================================
// Name        : Searching.cpp
// Author      : Mahima
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "arrayList.h"
#include "sortedArrayList.h"
#include "linkedList.h"
#include "hashtable.h"
#include "hashtablechaining.h"

using namespace std;

int main() {
	int choice = 0;
	do {
			arrayList<int> arr = arrayList<int>(10);
			arr.insertEnd(5);
			arr.insertEnd(15);
			arr.insertEnd(10);
			arr.insertEnd(10);
			arr.insertEnd(25);
			arr.insertEnd(20);
			arr.insertEnd(30);
			arr.insertEnd(35);
			arr.insertEnd(10);
			arr.insertEnd(40);
			cout << "Normal Array: ";
			arr.print();
			cout << endl;
			
			sortedArrayList<int> sortedArr = sortedArrayList<int>(10);
			for(int i = 0; i < sortedArr.maxListSize(); i++) {
				sortedArr.insert(i * 5);
			}
			cout << "Sorted Array: ";
			sortedArr.print();
			cout << endl;
			
			linkedList<int> list = linkedList<int>(10);
			for(int i = 0; i < 10; i++) {
				list.insertEnd(i * 3);
			}
			cout << "Linked List: ";
			list.print();
			cout << endl << endl;

			HashTableChaining hashTableChaining = HashTableChaining(10);
			hashTableChaining.insert(15);
			hashTableChaining.insert(25);
			hashTableChaining.insert(32);
			hashTableChaining.insert(5);
			hashTableChaining.insert(12);
			hashTableChaining.insert(24);
			hashTableChaining.insert(7);
			hashTableChaining.insert(17);
			cout << "Hash Table with Chaining: " << endl;
			hashTableChaining.print();
			cout << endl;


	        cout << "Choose your search type:" << endl;
	        cout << "1. Arrays: Sequential Search without recursion" << endl;
	        cout << "2. Arrays: Sequential Search with recursion" << endl;
	        cout << "3. Ordered Arrays: Binary Search without recursion" << endl;
	        cout << "4. Ordered Arrays: Binary Search with recursion" << endl;
	        cout << "5. Linked List: Search without recursion"  << endl;
	        cout << "6. Linked List: Search with recursion" << endl;
			cout << "7. Arrays: Hashing with linear probing" << endl;
			cout << "8. Arrays: Hashing with chaining" << endl;
			cout << "9. Arrays: Hashing with quadratic probing" << endl;
	        cout << "Enter 0 to exit" << endl;
	        cout << "Your choice: ";

	        cin >> choice;

	        switch(choice) {
				case 1: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						int index = arr.seqSearchIter(element);
						if(index != -1) {cout << "Element found at index: " << index << endl;} 
						else {cout << "Element not found in the array." << endl;}
						break;
				}
				case 2: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						int index = arr.seqSearchRec(element);
						if(index != -1) {cout << "Element found at index: " << index << endl;}
						else {cout << "Element not found in the array." << endl;}
						break;
				}
				case 3: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						int index = sortedArr.binarySearchIter(element);
						if(index != -1) {cout << "Element found at index: " << index << endl;}
						else {cout << "Element not found in the array." << endl;}
						break;
				}
				case 4: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						int index = sortedArr.binarySearchRec(element);
						if(index != -1) {cout << "Element found at index: " << index << endl;}
						else {cout << "Element not found in the array." << endl;}
						break;
				}
				case 5: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						bool found = list.seqSearchIter(element);
						if(found) {cout << "Element found in the linked list." << endl;}
						else {cout << "Element not found in the linked list." << endl;}
						break;
				}
				case 6: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						bool found = list.seqSearchRec(element, nullptr);
						if(found) {cout << "Element found in the linked list." << endl;}
						else {cout << "Element not found in the linked list." << endl;}
						break;
				}
				case 7: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						int index = hashTableChaining.search(element);
						if(index != -1) {cout << "Element found in the hash table at index " << index << "." << endl;}
						else {cout << "Element not found in the hash table." << endl;}
						break;
				}
				case 8: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						int index = hashTableChaining.search(element);
						if(index != -1) {cout << "Element found in the hash table at index " << index << "." << endl;}
						else {cout << "Element not found in the hash table." << endl;}
						break;
				}
				case 9: {
						int element;
						cout << "Enter Element" << endl;
						cin >> element;
						break;
				}
				default: {
						if(choice != 0) {
							cout << "Invalid choice. Please try again." << endl;
						}
						break;
				}
			}
		cout << endl;
	 } while(choice!=0);
	return 0;
}
