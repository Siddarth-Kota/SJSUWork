#include <iostream>
#include <stack>
#include <stdexcept>
#include "Robot.h"

using namespace std;

Robot::Robot() : Robot(0, 0) {}
Robot::Robot(int x, int y) {
    this->x = x;
    this->y = y;
    opCount = 0;
}

void Robot::move(char direction) {
    switch (direction) {
        case 'u':
            y++;
            break;
        case 'd':
            y--;
            break;
        case 'l':
            x--;
            break;
        case 'r':
            x++;
            break;
        default:
            cout << "Invalid direction!" << endl;
    }
    undoStack.push(string(1, direction));
    AllOps[opCount++] = string(1, direction);
}

void Robot::undo(int steps) {
    if(undoStack.empty()) {
        throw "No operations to undo.";
        return;
    }
    for (int i = 0; i < steps; i++) {
        if(undoStack.empty()) {
            throw "No more operations to undo.";
        }
        string lastMove = undoStack.top();
        undoStack.pop();
        redoStack.push(lastMove);
        AllOps[opCount++] = "undo " + lastMove;
        char direction = lastMove[0];
        switch (direction) {
            case 'u':
                y--;
                break;
            case 'd':
                y++;
                break;
            case 'l':
                x++;
                break;
            case 'r':
                x--;
                break;
            default:
                throw "Invalid direction!";
        }
    }
}

void Robot::redo(int steps) {
    if(redoStack.empty()) {
        throw "No operations to redo.";
        return;
    }
    for (int i = 0; i < steps; i++) {
        if(redoStack.empty()) {
            throw "No more operations to redo.";
            break;
        }
        string lastRedo = redoStack.top();
        redoStack.pop();
        undoStack.push(lastRedo);
        AllOps[opCount++] = "redo " + lastRedo;
        char direction = lastRedo[0];
        switch (direction) {
            case 'u':
                y++;
                break;
            case 'd':
                y--;
                break;
            case 'l':
                x--;
                break;
            case 'r':
                x++;
                break;
            default:
                throw "Invalid direction!";
        }
    }
}

string Robot::getState() {
    return "Robot Position: (" + to_string(x) + ", " + to_string(y) + ")";
}

void Robot::printAllOperations() {
    cout << "\nAll Operations:" << endl;
    for (int i = 0; i < opCount; i++) {
        cout << AllOps[i] << endl;
    }
}

void Robot::checkStacks() {
    cout << "\nUndo Stack:" << endl;
    stack<string> tempUndo = undoStack;
    while (!tempUndo.empty()) {
        cout << tempUndo.top() << endl;
        tempUndo.pop();
    }

    cout << "\nRedo Stack:" << endl;
    stack<string> tempRedo = redoStack;
    while (!tempRedo.empty()) {
        cout << tempRedo.top() << endl;
        tempRedo.pop();
    }
    cout << endl;
}

Robot::~Robot() {}

int Robot::getX() {
    return x;
}

int Robot::getY() {
    return y;
}