#ifndef FLIGHT_H_
#define FLIGHT_H_

#include <iostream>
#include <string>
using namespace std;

class Flight {
private:
	string number;
	string departure_airport;
	string arrival_airport;

public:
	Flight();
	virtual ~Flight();
	const string& getDepartureAirport() const;
	void setDepartureAirport(const string&);
	string getNumber() const;
	void setNumber(string);
	const string& getArrivalAirport() const;
	void setArrivalAirport(const string&);
	friend istream& operator>>(istream& input, Flight& flight);
	friend bool operator==(const Flight& flight, const string& name);
	friend ostream& operator<<(ostream& output, const Flight& flight);

};

#endif /* FLIGHT_H_ */
