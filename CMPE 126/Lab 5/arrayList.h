#ifndef ARRAYLIST_H
#define ARRAYLIST_H

#include <iostream>
#include <stdexcept>

using namespace std;

template <class T>
class arrayList {
private:
    T* list;
    int length;
    int maxSize;
public:
    arrayList() : list(nullptr), length(0), maxSize(0) {}
    arrayList(int capacity) : length(0), maxSize(capacity) {
        list = new T[maxSize];
    }
    ~arrayList() {
        delete[] list;
    }

    bool isEmpty() const { return length == 0; }
    bool isFull() const { return length == maxSize; }
    int listSize() const { return length; }
    int maxListSize() const { return maxSize; }

    void print() const {
        for (int i = 0; i < length; ++i) {
            cout << list[i] << " | ";
        }
        cout << endl;
    }

    bool isItemAtEqual(int index, const T& item) const {
        if (index < 0 || index >= length) {
            throw out_of_range("Index out of range");
        }
        return list[index] == item;
    }

    void insertAt(int index, const T& item) {
        if (index < 0 || index > length) {
            throw out_of_range("Index out of range");
        }
        if (isFull()) {
            throw overflow_error("List is full");
        }
        for (int i = length; i > index; --i) {
            list[i] = list[i - 1];
        }
        list[index] = item;
        ++length;
    }

    void insertEnd(const T& item) {
        insertAt(length, item);
    }

    void removeAt(int index) {
        if (index < 0 || index >= length) {
            throw out_of_range("Index out of range");
        }
        for (int i = index; i < length - 1; ++i) {
            list[i] = list[i + 1];
        }
        --length;
    }

    T retrieveAt(int index) const {
        if (index < 0 || index >= length) {
            throw out_of_range("Index out of range");
        }
        return list[index];
    }

    void replaceAt(int index, const T& item) {
        if (index < 0 || index >= length) {
            throw out_of_range("Index out of range");
        }
        list[index] = item;
    }

    void clearList() {
        delete[] list;
        list = new T[maxSize];
        length = 0;
    }

    arrayList& operator=(const arrayList& other) {
        if (this != &other) {
            delete[] list;
            maxSize = other.maxSize;
            length = other.length;
            list = new T[maxSize];
            for (int i = 0; i < length; ++i) {
                list[i] = other.list[i];
            }
        }
        return *this;
    }

    T getMinRecursive(int index = 0) const {
        if (isEmpty()) {
            throw underflow_error("List is empty");
        }
        if (index == length - 1) {
            return list[index];
        }
        T minRest = getMinRecursive(index + 1);
        return (list[index] < minRest) ? list[index] : minRest;
    }    
};

#endif // ARRAYLIST_H