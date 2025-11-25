#ifndef HASHTABLE_H
#define HASHTABLE_H

#include <iostream>
#include <stdexcept>

using namespace std;

class Hashtable {
private:
    int HTsize;
    int* array;
public:
    Hashtable(int size) : HTsize(size) {
        if (size <= 0) {
            throw invalid_argument("Hashtable size must be positive.");
        }
        array = new int[HTsize];
        for (int i = 0; i < HTsize; ++i) {
            array[i] = NULL;
        }
    }

    ~Hashtable() {
        delete[] array;
    }
    
    void print() const {
        for (int i = 0; i < HTsize; i++) {
            cout << "Index " << i << ": " << array[i] << endl;
        }
    }

    bool insert(const int& element) {
        int index = element % HTsize;
        if (array[index] == NULL) {
            array[index] = element;
            return true;
        } 
        else {
            return false;
        }
    }

    int search(const int& element) const {
        int index = element % HTsize;
        return (array[index] == element) ? index : -1;
    }
};

#endif // HASHTABLE_H