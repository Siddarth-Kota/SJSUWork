#ifndef SORTED_LINKED_LIST_H
#define SORTED_LINKED_LIST_H

#include "linkedList.h"
#include <iostream>
#include <stdexcept>

using namespace std;

template <class T>
class SortedLinkedList {
private:
    LinkedList<T>* list;
public:
    SortedLinkedList(int maxSize) : list(new LinkedList<T>(maxSize)) {}
    SortedLinkedList(const LinkedList<T>& other) : list(new LinkedList<T>(other.maxListSize())) {
        for (int i = 0; i < other.listSize(); ++i) {
            insert(other.retreiveAt(i));
        }
    }
    SortedLinkedList(const SortedLinkedList<T>& other) : list(new LinkedList<T>(other.list->maxListSize())) {
        for (int i = 0; i < other.list->listSize(); ++i) {
            insert(other.list->retreiveAt(i));
        }
    }
    ~SortedLinkedList() { delete list; }

    bool isEmpty() const { return list->isEmpty(); }
    bool isFull() const { return list->isFull(); }
    int listSize() const { return list->listSize(); }
    int maxListSize() const { return list->maxListSize(); }

    void print() const { list->print(); }
    void insert(T item) {
        if (isFull()) {
            throw out_of_range("list is full");
        }
        int index = 0;
        while (index < list->listSize() && list->retreiveAt(index) < item) {
            index++;
        }
        list->insertAt(index, item);
    }

    void remove(T item) {
        if (isEmpty()) {
            throw out_of_range("list is empty");
        }
        int index = 0;
        while (index < list->listSize() && list->retreiveAt(index) < item) {
            index++;
        }
        if (index < list->listSize() && list->retreiveAt(index) == item) {
            list->removeAt(index);
        } else {
            throw invalid_argument("item not found in the list");
        }
    }

    bool isItemInList(T item) const {
        int index = 0;
        while (index < list->listSize() && list->retreiveAt(index) < item) {
            index++;
        }
        return index < list->listSize() && list->retreiveAt(index) == item;
    }

    T retrieveAt(int index) const { return list->retreiveAt(index); }
    void clearList() { list->clearList(); }

    SortedLinkedList<T>& operator=(const SortedLinkedList<T>& other) {
        if (this != &other) {
            delete list;
            list = new LinkedList<T>(*other.list);
        }
        return *this;
    }
};

#endif // SORTED_LINKED_LIST_H