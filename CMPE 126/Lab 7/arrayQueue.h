#ifndef ARRAYQUEUE_H
#define ARRAYQUEUE_H

#include <stdexcept>

using namespace std;

template <typename T> class arrayQueue {
    private:
        T* array;
        int capacity;
        int frontIndex = 0;
        int rearIndex = 0;

    public:
        arrayQueue() : capacity(100) {
            array = new T[capacity];
        }

        arrayQueue(int cap) : capacity(cap) {
            array = new T[capacity];
        }

        ~arrayQueue() {
            delete[] array;
        }


        void enqueue(const T& element) {
            if (isFull()) {
                throw "Queue is full";
            }
            array[rearIndex] = element;
            rearIndex = (rearIndex + 1) % capacity;
        }

        T dequeue() {
            if (isEmpty()) {
                throw "Queue is empty";
            }
            T frontElement = array[frontIndex];
            frontIndex = (frontIndex + 1) % capacity;
            return frontElement;
        }

        T front() {
            if(isEmpty()) {
                throw "Queue is empty";
            }
            return array[frontIndex];
        }

        int size() const {return (capacity - frontIndex + rearIndex) % capacity;}
        int maxSize() const {return capacity;}
        
        bool isEmpty() const {return frontIndex == rearIndex;}
        bool isFull() const {return size() == capacity;}
};

#endif // ARRAYQUEUE_H