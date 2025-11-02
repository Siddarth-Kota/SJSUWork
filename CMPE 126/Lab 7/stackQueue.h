#ifndef STACKQUEUE_H
#define STACKQUEUE_H

#include <stdexcept>
#include <stack>

using namespace std;

template <typename T> class stackQueue {
    private:
        stack<T> stack1;
        stack<T> stack2;
        int capacity; // -1 for unbounded

    public:

    stackQueue(int maxSize = -1) : capacity(maxSize) {}
    ~stackQueue() {}

        void enqueue(const T& element) {
            if (capacity >= 0 && size() >= capacity) {
                throw "Queue is full";
            }
            stack1.push(element);
        }

        T dequeue() {
            if (stack2.empty()) {
                while (!stack1.empty()) {
                    stack2.push(stack1.top());
                    stack1.pop();
                }
            }
            if (stack2.empty()) {
                throw "Queue is empty";
            }
            T val = stack2.top();
            stack2.pop();
            return val;
        }

        T front() {
            if (stack2.empty()) {
                while (!stack1.empty()) {
                    stack2.push(stack1.top());
                    stack1.pop();
                }
            }
            if (stack2.empty()) {
                throw "Queue is empty";
            }
            return stack2.top();
        }

        int size() const {
            return stack1.size() + stack2.size();
        }

        bool isEmpty() const {
            return stack1.empty() && stack2.empty();
        }

        bool isFull() const {
            return (capacity >= 0) && (size() >= capacity);
        }

        int maxSize() const {
            return capacity;
        }
};

#endif // STACKQUEUE_H