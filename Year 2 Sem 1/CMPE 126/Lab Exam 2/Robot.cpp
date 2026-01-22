#include <iostream>
#include <stack>
#include <queue>
#include <stdexcept>
#include "Robot.h"

using namespace std;

bool Robot::blocked[6][6] = { {false} };
stack<string> Robot::moves;

Robot::Robot() : Robot(0, 0) {}
Robot::Robot(int x, int y) {
    this->x = x;
    this->y = y;
    opCount = 0;
}

void Robot::move(char direction) {
    int newX = x;
    int newY = y;
    switch (direction) {
        case 'u':
            newY++;
            break;
        case 'd':
            newY--;
            break;
        case 'l':
            newX--;
            break;
        case 'r':
            newX++;
            break;
        default:
            cout << "Invalid direction!" << endl;
            return;
    }
    
    x = newX;
    y = newY;

    branchStack.push_back({x, y});

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
        if (!branchStack.empty()) branchStack.pop_back();
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
        branchStack.push_back({x, y});
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

bool Robot::isBlocked(int x, int y) {
    if (x < 0 || x >= 6 || y < 0 || y >= 6) {
        return false;
    }
    return blocked[y][x];
}

void Robot::markBranchBlocked() {
    for (auto &p : branchStack) {
        int bx = p.first;
        int by = p.second;
        if (bx >= 0 && bx < 6 && by >= 0 && by < 6) blocked[by][bx] = true;
    }
    branchStack.clear();
}

void Robot::clearBranchStack() {
    branchStack.clear();
}

void Robot::addMove(string move) {
    moves.push(move);
}

void Robot::doMoves() {
    cout << "Moves Needed: " << endl;
    while (!moves.empty()) {
        string move = moves.top();
        cout << move << " ";
        moves.pop();
        if (move == "u" || move == "d" || move == "l" || move == "r") {
            this->move(move[0]);
        }
    }
    cout << endl;
}