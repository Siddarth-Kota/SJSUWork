#ifndef ARRAY_STACK_H
#define ARRAY_STACK_H

#include <stdexcept>

using namespace std;

template <typename T>
class ArrayStack {
private:
    static const int DEFAULT_CAPACITY = 100;
    T* array;
    int topIndex;
    int capacity;

    void resize(int newCapacity) {
        T* temp = new T[newCapacity];
        for (int i = 0; i <= topIndex; i++) {
            temp[i] = array[i];
        }
        delete[] array;
        array = temp;
        capacity = newCapacity;
    }

public:
    ArrayStack(int initialCapacity = DEFAULT_CAPACITY) : 
        capacity(initialCapacity), 
        topIndex(-1) {
        if (initialCapacity <= 0) {
            throw invalid_argument("Capacity must be positive");
        }
        array = new T[capacity];
    }

    ~ArrayStack() {
        delete[] array;
    }

    ArrayStack(const ArrayStack& other) : 
        capacity(other.capacity),
        topIndex(other.topIndex) {
        array = new T[capacity];
        for (int i = 0; i <= topIndex; i++) {
            array[i] = other.array[i];
        }
    }

    ArrayStack& operator=(const ArrayStack& other) {
        if (this != &other) {
            delete[] array;
            capacity = other.capacity;
            topIndex = other.topIndex;
            array = new T[capacity];
            for (int i = 0; i <= topIndex; i++) {
                array[i] = other.array[i];
            }
        }
        return *this;
    }

    void push(const T& value) {
        if (topIndex == capacity - 1) {
            resize(capacity * 2);
        }
        array[++topIndex] = value;
    }

    T pop() {
        if (empty()) {
            throw runtime_error("Stack is empty");
        }
        T value = array[topIndex--];
        
        if (topIndex + 1 < capacity / 4 && capacity > DEFAULT_CAPACITY) {
            resize(capacity / 2);
        }
        
        return value;
    }

    T& top() {
        if (empty()) {
            throw runtime_error("Stack is empty");
        }
        return array[topIndex];
    }

    const T& top() const {
        if (empty()) {
            throw runtime_error("Stack is empty");
        }
        return array[topIndex];
    }

    bool empty() const {
        return topIndex == -1;
    }

    int size() const {
        return topIndex + 1;
    }

    void clear() {
        topIndex = -1;
        if (capacity > DEFAULT_CAPACITY) {
            resize(DEFAULT_CAPACITY);
        }
    }
};

#endif // ARRAY_STACK_H
