//============================================================================
// Name        : sumHex.cpp
// Author      : Mahima
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <cmath>
#include <string>
#include <sstream>

using namespace std;

int sumCode(const string input) {
	if(input.empty()) {
		return 0;
	}
	char inputchar = input[0];
	if (inputchar >= 'A' && inputchar <= 'Z') {
		int val = (inputchar - 'A');
		return val + sumCode(input.substr(1));
	} else {
		cout << "Error: Invalid Input" << endl;
		return -1;
	}
}

int main() {
	int sum;
	sum = sumCode("AAAA");
	cout << sum << endl; //expects 0

	sum = sumCode("ABCD");
	cout << sum << endl; //expects 6

	sum = sumCode("ABCDE");
	cout << sum << endl; //expects 10

	/*Comment this line if you want to try error checking
	try{
		sum = sumCode("1234");
		cout << sum << endl; //should throw an error
	}
	catch(const char *s){
		cout << s << endl;
	}

	//*/

	return 0;
}
