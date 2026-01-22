
#ifndef ROBOT_H_
#define ROBOT_H_

#include <string>
#include <stack>
#include <vector>
#include <utility>

using namespace std;

class Robot {
private:
	int x;
	int y;
	stack<string> undoStack;
	stack<string> redoStack;
	string AllOps[100];
	int opCount;
	static bool blocked[6][6];
	vector<std::pair<int,int>> branchStack;
	static stack<string> moves;

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

	static bool isBlocked(int, int);
	void markBranchBlocked();
	void clearBranchStack();

	void addMove(string move);
	void doMoves();

	virtual ~Robot();
};

#endif /* ROBOT_H_ */
