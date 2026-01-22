#ifndef HASHTABLEQUAD_H
#define HASHTABLEQUAD_H

#include <iostream>
#include <stdexcept>

using namespace std;

class HashTableQuad {
private:
    int HTsize;
    int* array;
public:
    HashTableQuad(int size) : HTsize(size) {
        if (size <= 0) {
            throw invalid_argument("Hashtable size must be positive.");
        }
        array = new int[HTsize];
        for (int i = 0; i < HTsize; ++i) {
            array[i] = NULL;
        }
    }

    ~HashTableQuad() {
        delete[] array;
    }
    
    void print() const {
        for (int i = 0; i < HTsize; i++) {
            if(array[i] != NULL) {
                cout << "Index " << i << ": " << array[i] << endl;
            } 
            else {
                cout << "Index " << i << ": " << "Index Not Filled" << endl;
            }
        }
    }

    bool insert(const int& element) {
        int hash = element % HTsize;
        if (hash < 0) hash += HTsize;
        for (int i = 0; i < HTsize; ++i) {
            int idx = (hash + i * i) % HTsize;
            if (array[idx] == NULL) {
                array[idx] = element;
                return true;
            }
            if (array[idx] == element) {
                return false;
            }
        }
        return false;
    }

    int search(const int& element) const {
        int hash = element % HTsize;
        if (hash < 0) hash += HTsize;
        for (int i = 0; i < HTsize; ++i) {
            int idx = (hash + i * i) % HTsize;
            if (array[idx] == NULL) return -1; 
            if (array[idx] == element) return idx;
        }
        return -1;
    }

    bool remove(const int& element) {
        int hash = element % HTsize;
        if (hash < 0) hash += HTsize;
        for (int i = 0; i < HTsize; ++i) {
            int idx = (hash + i * i) % HTsize;
            if (array[idx] == NULL) return false; 
            if (array[idx] == element) {
                array[idx] = NULL;
                return true;
            }
        }
        return false;
    }
};

#endif // HASHTABLEQUAD_H