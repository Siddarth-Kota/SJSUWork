
#ifndef ROBOT_H_
#define ROBOT_H_

#include <string>
#include <stack>

using namespace std;

class Robot {
private:
	int x;
	int y;
	stack<string> undoStack;
	stack<string> redoStack;
	string AllOps[100];
	int opCount;

public:
	Robot();
	Robot(int, int);

	void move(char);
	void undo(int);
	void redo(int);
	string getState();
	void printAllOperations();
	void checkStacks();

	int getX();
	int getY();

	virtual ~Robot();
};

#endif /* ROBOT_H_ */
