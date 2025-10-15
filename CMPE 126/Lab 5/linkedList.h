#ifndef LINKED_LIST_H
#define LINKED_LIST_H

#include <iostream>
#include <stdexcept>

using namespace std;

template <class T> class LinkedList {
private:
    struct Node {
        T data;
        Node* next;
        Node(T val) : data(val), next(nullptr) {}
    };
    int size;
    int maxSize;
    Node* head;
public:
    LinkedList(int maxSize) : size(0), maxSize(maxSize), head(nullptr) {}
    LinkedList(int maxSize, T item) : size(1), maxSize(maxSize) {
        head = new Node(item);
        head->next = nullptr;
    }
    ~LinkedList() {
        Node* current = head;
        while (current) {
            Node* next = current->next;
            delete current;
            current = next;
        }
    }

    bool isEmpty() const {return size == 0;}
    bool isFull() const {return size == maxSize;}
    int listSize() const {return size;}
    int maxListSize() const {return maxSize;}

    void print() const {
        Node* current = head;
        while (current) {
            cout << current->data << " -> ";
            current = current->next;
        }
        cout << "nullptr" << endl;
    }

    bool isItemAtEqual(int index, T item) const {
        if (index < 0 || index >= size) return false;
        Node* current = head;
        for (int i = 0; i < index; i++) {
            current = current->next;
        }
        return current->data == item;
    }

    void insertAt(int index, T item) {
        if(isFull() || index < 0 || index > size) {
            throw out_of_range("index is out of range or list is full");
        }
        Node* newNode = new Node(item);
        if(index == 0) {
            newNode->next = head;
            head = newNode;
        }
        else {
            Node* current = head;
            for(int i = 0; i < index - 1; i++) {
                current = current->next;
            }
            newNode->next = current->next;
            current->next = newNode;
        }
        size++;
    }

    void insertEnd(T item) {
        if(isFull()) {
            throw out_of_range("list is full");
        }
        Node* newNode = new Node(item);
        if(isEmpty()) {
            head = newNode;
        }
        else {
            Node* current = head;
            while(current->next) {
                current = current->next;
            }
            current->next = newNode;
        }
        size++;
    }

    void removeAt(int index) {
        if (index < 0 || index >= size) {
            throw out_of_range("index is out of range");
        }
        Node* toDelete;
        if (index == 0) {
            toDelete = head;
            head = head->next;
        } else {
            Node* current = head;
            for (int i = 0; i < index - 1; i++) {
                current = current->next;
            }
            toDelete = current->next;
            current->next = toDelete->next;
        }
        delete toDelete;
        size--;
    }

    T retreiveAt(int index) const {
        if (index < 0 || index >= size) {
            throw out_of_range("index is out of range");
        }
        Node* current = head;
        for (int i = 0; i < index; i++) {
            current = current->next;
        }
        return current->data;
    }

    void replaceAt(int index, T item) {
        if (index < 0 || index >= size) {
            throw out_of_range("index is out of range");
        }
        Node* current = head;
        for (int i = 0; i < index; i++) {
            current = current->next;
        }
        current->data = item;
    }

    void clearList() {
        Node* current = head;
        while(current) {
            Node* next = current->next;
            delete current;
            current = next;
        }
        head = nullptr;
        size = 0;
    }

    LinkedList& operator=(const LinkedList& other) {
        if(this != &other) {
            clearList();
            maxSize = other.maxSize;
            Node* current = other.head;
            while(current) {
                insertEnd(current->data);
                current = current->next;
            }
        }
        return *this;
    }
    
    T getMinRecursive(Node* node = nullptr) const {
        if (isEmpty()) {
            throw underflow_error("List is empty");
        }

        if (node == nullptr) node = head;

        if (node->next == nullptr) {
            return node->data;
        }

        T minRest = getMinRecursive(node->next);
        return (node->data < minRest) ? node->data : minRest;
    }
};

#endif // LINKED_LIST_H