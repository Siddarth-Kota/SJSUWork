#include <iostream>
#include <fstream>
#include <string>

#include "Flight.h"
#include "Flight.cpp"

using namespace std;

#define MAXFLIGHTS 64

void sortFlightsByArrival(Flight* flights, int num_flights) {
	for(int i = 0; i < num_flights - 1; i++) {
		for(int j = 0; j < num_flights - i - 1; j++) {
			if(flights[j].getArrivalAirport() > flights[j + 1].getArrivalAirport()) {
				Flight temp = flights[j];
				flights[j] = flights[j + 1];
				flights[j + 1] = temp;
			}
		}
	}
}

int read_cplus(string filename, Flight* flights){
	ifstream fin(filename);
	int index = 0;
	while(!fin.eof() && index < MAXFLIGHTS){
		Flight temp;
		fin >> temp; 
		flights[index++] = temp;
	}
	sortFlightsByArrival(flights, index);
	return index;
}

int read(string filename, Flight* flights){
	ifstream fin(filename);
	int index = 0;
	while(!fin.eof() && index < MAXFLIGHTS){
		Flight temp;
		string word;
		getline(fin, word, ',');
		temp.setNumber(word);
		getline(fin, word, ',');
		temp.setDepartureAirport(word);
		getline(fin, word);
		temp.setArrivalAirport(word);
		flights[index++] = temp;
	}
	sortFlightsByArrival(flights, index);
	return index;
}


int basicSearch(Flight* flights, string name, int num_flights){
	for(int i = 0; i < num_flights; i++){
		if(flights[i] == name) {
			return i;
		}
	}
	return -1;
}

void searchAll(Flight* flights, string arrival_airport, int num_flights){
	int* indices = new int[num_flights];
	int count = 0;
	for(int i = 0; i < num_flights; i++){
		if(flights[i].getArrivalAirport() == arrival_airport) {
			indices[count++] = i;
		}
	}
	if(count > 0) {
		cout << "  Flights arriving at " << arrival_airport << ":\n";
		for(int i = 0; i < count; i++){
			int idx = indices[i];
			cout << "	Index: " << idx << ", " << flights[idx];
		}
	} 
	else {
		cout << "  No flights found arriving at " << arrival_airport << ".\n";
	}
	delete[] indices;
}

void binarySearchAll(Flight* flights, string arrival_airport, int num_flights) {
	int left = 0, right = num_flights - 1;
	int first = -1, last = -1;
	
	while(left <= right) {
		int mid = left + (right - left) / 2;
		if(flights[mid].getArrivalAirport() == arrival_airport) {
			first = mid;
			right = mid - 1;
		}
		else if(flights[mid].getArrivalAirport() < arrival_airport) {
			left = mid + 1;
		}
		else {
			right = mid - 1;
		}
	}

	if(first == -1) {
		cout << "  No flights found arriving at " << arrival_airport << ".\n";
		return;
	}

	left = first;
	right = num_flights - 1;
	while(left <= right) {
		int mid = left + (right - left) / 2;
		if(flights[mid].getArrivalAirport() == arrival_airport) {
			last = mid;
			left = mid + 1;
		}
		else if(flights[mid].getArrivalAirport() < arrival_airport) {
			left = mid + 1;
		}
		else {
			right = mid - 1;
		}
	}

	cout << "  Flights arriving at " << arrival_airport << ":\n";
	for(int i = first; i <= last; i++) {
		cout << "	Index: " << i << ", " << flights[i];
	}
}

void ternarySearchAll(Flight* flights, string arrival_airport, int low, int high, int num_flights) {
	int first = -1, last = -1;
	
	int left = low, right = high;
	while(left <= right) {
		int mid1 = left + (right - left) / 3;
		int mid2 = right - (right - left) / 3;
		
		if(flights[mid1].getArrivalAirport() == arrival_airport) {
			first = mid1;
			right = mid1 - 1;
		}
		else if(flights[mid2].getArrivalAirport() == arrival_airport) {
			first = mid2;
			right = mid2 - 1;
		}
		else if(arrival_airport < flights[mid1].getArrivalAirport()) {
			right = mid1 - 1;
		}
		else if(arrival_airport > flights[mid2].getArrivalAirport()) {
			left = mid2 + 1;
		}
		else {
			left = mid1 + 1;
			right = mid2 - 1;
		}
	}
	
	if(first == -1) {
		cout << "  No flights found arriving at " << arrival_airport << ".\n";
		return;
	}
	
	left = first;
	right = high;
	while(left <= right) {
		int mid1 = left + (right - left) / 3;
		int mid2 = right - (right - left) / 3;
		
		if(flights[mid1].getArrivalAirport() == arrival_airport) {
			last = mid1;
			left = mid1 + 1;
		}
		else if(flights[mid2].getArrivalAirport() == arrival_airport) {
			last = mid2;
			left = mid2 + 1;
		}
		else if(arrival_airport < flights[mid1].getArrivalAirport()) {
			right = mid1 - 1;
		}
		else if(arrival_airport > flights[mid2].getArrivalAirport()) {
			left = mid2 + 1;
		}
		else {
			left = mid1 + 1;
			right = mid2 - 1;
		}
	}

	cout << "  Flights arriving at " << arrival_airport << ":\n";
	for(int i = first; i <= last; i++) {
		cout << "	Index: " << i << ", " << flights[i];
	}
}

int main() {

	//TASK 1:
	//read_cplus function
	cout << "TASK 1" << endl;
	cout << "Testing read_cplus function:" << endl;
	Flight flights_cplus[MAXFLIGHTS];
	int num_flights = read_cplus("flights.txt", flights_cplus);
	cout << "  Read " << num_flights << " flights." << endl;
	for(int i = 0; i < num_flights; i++){
		cout << "	" << flights_cplus[i];
	}
	//read function
	cout << "\nTesting read Function:" << endl;
	Flight flights_read[MAXFLIGHTS];
	int total = read("flights.txt", flights_read);
	cout << "  Read " << total << " flights." << endl;
	for(int i = 0; i < total; i++){
		cout << "	" << flights_read[i];
	}
	//basicSearch function
	cout << "\nTesting basicSearch Function:" << endl;
	//string search_flight = "AA123";
	string search_flight = "AF8661";
	int found_index = basicSearch(flights_cplus, search_flight, num_flights);
	if(found_index != -1) {
		cout << "	Flight " << search_flight << " found at index " << found_index << endl;
	} 
	else {
		cout << "	Flight " << search_flight << " not found." << endl;
	}


	//TASK 2:
	//searchAll function
	cout << "\n----------------------------------------------------------------------" << endl;
	cout << "TASK 2" << endl;
	cout << "\nTesting searchAll Function:" << endl;
	Flight flights_task2[MAXFLIGHTS];
	int num_flights_task2 = read("flights.txt", flights_task2);
	string search_arrival = "LAX";
	searchAll(flights_task2, search_arrival, num_flights_task2);
	string search_arrival2 = "HND";
	searchAll(flights_task2, search_arrival2, num_flights_task2);


	//TASK 3:
	//binarySearchAll function
	cout << "\n----------------------------------------------------------------------" << endl;
	cout << "TASK 3" << endl;
	cout << "\nTesting binarySearchAll Function:" << endl;	
	Flight flights_binSearch[MAXFLIGHTS];
	int num_flights_binSearch = read("flights.txt", flights_binSearch);
	//string search_arrival_binSearch = "LAX";
	string search_arrival_binSearch = "MEL";
	binarySearchAll(flights_binSearch, search_arrival_binSearch, num_flights_binSearch);

	//ternarySearch function
	cout << "\nTesting ternarySearchAll Function:" << endl;
	Flight flights_ternary[MAXFLIGHTS];
	int num_flights_ternary = read("flights.txt", flights_ternary);
	//string search_arrival_ternary = "LAX";
	string search_arrival_ternary = "CDG";
	ternarySearchAll(flights_ternary, search_arrival_ternary, 0, num_flights_ternary - 1, num_flights_ternary);

	return 0;
}