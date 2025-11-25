#ifndef HASHTABLECHAINING_H
#define HASHTABLECHAINING_H

#include <iostream>
#include <stdexcept>

#include "linkedList.h"

using namespace std;

class HashTableChaining {
private:
    int HTsize;
    linkedList<int>** table;
public:
    HashTableChaining(int size) : HTsize(size) {
        if (size <= 0) {
            throw invalid_argument("Hashtable size must be positive.");
        }
        table = new linkedList<int>*[HTsize];
        for (int i = 0; i < HTsize; ++i) {
            table[i] = nullptr;
        }
    }

    ~HashTableChaining() {
        for (int i = 0; i < HTsize; ++i) {
            if (table[i]) delete table[i];
        }
        delete[] table;
    }

    void print() const {
        for (int i = 0; i < HTsize; i++) {
            cout << "Index " << i << ": ";
            if (table[i] == nullptr) {
                cout << "nullptr";
            } 
            else {
                table[i]->print();
            }
            cout << endl;
        }
    }

    bool insert(const int& element) {
        int index = element % HTsize;
        if (index < 0) index += HTsize;
        if (table[index] == nullptr) {
            table[index] = new linkedList<int>(HTsize);
        }
        if (table[index]->seqSearchIter(element)) {
            return false;
        }
        table[index]->insertEnd(element);
        return true;
    }

    int search(const int& element) const {
        int index = element % HTsize;
        if (index < 0) index += HTsize;
        if (table[index] == nullptr) return -1;
        if (table[index]->seqSearchIter(element)) return index;
        return -1;
    }
};
#endif // HASHTABLECHAINING_H