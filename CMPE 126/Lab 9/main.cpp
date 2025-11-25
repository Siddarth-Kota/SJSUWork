//============================================================================
// Name        : Searching.cpp
// Author      : Mahima
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-styleabout:blank#blocked
//============================================================================

#include <iostream>
using namespace std;

int main() {
	unsigned int choice = 0;
	do {
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

	        /****************************
	         * TODO: Implement what you will do with the choice
	         *****************************/

	        cout<<"\nSpecify the element to be searched for: ";

	 } while(choice!=0);
	return 0;
}