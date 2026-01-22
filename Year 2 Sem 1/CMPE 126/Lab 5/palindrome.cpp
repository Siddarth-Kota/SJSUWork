#include <iostream>
using namespace std;

bool check_palindrome(const int &n, int start = 0, int end = -1) {
	if (n < 0) return false;

	if (end == -1) {
		if (n == 0) {
			end = 0;
		} else {
			int tmp = n;
			int digits = 0;
			while (tmp > 0) {
				tmp /= 10;
				++digits;
			}
			end = digits - 1;
		}
	}

	if (start >= end) return true;

	int powEnd = 1;
	for (int i = 0; i < end; ++i) powEnd *= 10;
	int powStart = 1;
	for (int i = 0; i < start; ++i) powStart *= 10;

	int first = (n / powEnd) % 10;
	int last = (n / powStart) % 10;
	if (first != last) return false;

	return check_palindrome(n, start + 1, end - 1);
}
