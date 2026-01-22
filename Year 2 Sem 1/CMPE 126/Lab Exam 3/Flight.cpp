#include "Flight.h"
#include <string>

Flight::Flight() {
	number = "";
	departure_airport = "";
	arrival_airport = "";
}

const string& Flight::getDepartureAirport() const {
	return departure_airport;
}

void Flight::setDepartureAirport(const string& departure_airport) {
	this->departure_airport = departure_airport;
}

string Flight::getNumber() const {
	return number;
}

void Flight::setNumber(string number) {
	this->number = number;
}

const string& Flight::getArrivalAirport() const {
	return arrival_airport;
}

void Flight::setArrivalAirport(const string& arrival_airport) {
	this->arrival_airport = arrival_airport;
}

Flight::~Flight() {
	// TODO Auto-generated destructor stub
}


istream& operator>>(istream& input, Flight& flight) {
	string line;
	getline(input, line);
	size_t pos1 = line.find(',');
	size_t pos2 = line.find(',', pos1 + 1);

	if (pos1 != string::npos && pos2 != string::npos) {
		flight.number = line.substr(0, pos1);
		flight.departure_airport = line.substr(pos1 + 1, pos2 - pos1 - 1);
		flight.arrival_airport = line.substr(pos2 + 1);
	}
	return input;
}

bool operator==(const Flight& flight, const string& name) {
	return flight.number == name;
}

ostream& operator<<(ostream& output, const Flight& flight) {
	output << flight.number << ": " << flight.departure_airport << " -> " << flight.arrival_airport << endl;
	return output;
}