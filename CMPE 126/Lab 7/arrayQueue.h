#ifndef ARRAY_QUEUE_H
#define ARRAY_QUEUE_H

#include <stdexcept>
#include <cstddef>

template <typename T>
class ArrayQueue {
public:
    ArrayQueue(std::size_t capacity);
    ~ArrayQueue();

    void enqueue(const T& item);
    T dequeue();
    bool isEmpty() const;
    bool isFull() const;

private:
    T* data;
    std::size_t front;
    std::size_t rear;
    std::size_t maxSize;
};

#endif // ARRAY_QUEUE_H
