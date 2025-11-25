#ifndef SORTEDARRAYLIST_H
#define SORTEDARRAYLIST_H

#include "arrayList.h"
#include <stdexcept>

using namespace std;

template <class T> class sortedArrayList {
    private:
        arrayList<T> arrList;
        int maxSize;
        int size;
    public:
        sortedArrayList(int capacity) : arrList(capacity), maxSize(capacity), size(0) {}
        sortedArrayList(arrayList<T>& other) : maxSize(other.maxListSize()), size(other.listSize()) {
            for (int i = 0; i < other.listSize(); ++i) {
                insert(other.retrieveAt(i));
            }
        }

        ~sortedArrayList() {}

        bool isEmpty() const {return arrList.isEmpty();}
        bool isFull() const {return arrList.isFull();}

        int listSize() const {return size;}
        int maxListSize() const {return maxSize;}

        void print() {arrList.print();}

        void insert(const T& item) {
            if (isFull()) {
                throw overflow_error("List is full");
            }
            int index = 0;
            while (index < size && arrList.retrieveAt(index) < item) {
                index++;
            }
            arrList.insertAt(index, item);
            size++;
        }

        void remove(const T& item) {
            int index = 0;
            while (index < size && arrList.retrieveAt(index) < item) {
                index++;
            }
            if (index < size && arrList.retrieveAt(index) == item) {
                arrList.removeAt(index);
                size--;
            } else {
                throw invalid_argument("Item not found in the list");
            }
        }

        void clearList() {
            arrList.clearList();
            size = 0;
        }

        int binarySearchIter(const T& item) {
            int left = 0;
            int right = size - 1;
            while (left <= right) {
                int mid = left + (right - left) / 2;
                if (arrList.retrieveAt(mid) == item) {
                    return mid;
                }
                if (arrList.retrieveAt(mid) < item) {
                    left = mid + 1;
                } 
                else {
                    right = mid - 1;
                }
            }
            return -1; // Return -1 if item is not found
        }

        int binarySearchRec(const T& item, int left = 0, int right = -1) {
            if (right == -1) {
                right = size - 1;
            }
            if (left > right) {
                return -1; // Return -1 if item is not found
            }
            int mid = left + (right - left) / 2;
            if (arrList.retrieveAt(mid) == item) {
                return mid;
            }
            if (arrList.retrieveAt(mid) < item) {
                return binarySearchRec(item, mid + 1, right);
            } 
            else {
                return binarySearchRec(item, left, mid - 1);
            }
        }
    };


#endif // SORTEDARRAYLIST_H