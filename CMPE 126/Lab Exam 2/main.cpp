//============================================================================
// Name        : main.cpp
// Author      : Mahima
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <vector>

#include "Robot.h"
#include "Robot.cpp"
using namespace std;

bool maze_walls[5][6] = {
		{1,0,0,0,0,1},
		{1,0,0,0,1,1},
		{1,1,0,1,0,1},
		{1,0,0,0,0,1},
		{1,0,1,1,0,1}
};
bool maze_floors[6][5] = { //needs to be considered in reverse order for y-axis
		{1,1,1,1,1},
		{1,1,1,1,0},
		{1,0,1,1,0},
		{0,0,1,1,0},
		{0,1,0,1,0},
		{1,1,1,1,1}
};

/* Maze layout:

walls: vertical lines
floors: horizontal lines

 	0   1   2   3   4   5 (walls)
 	• - • - • - • - • - • 0
 4	|                   |
 	• - • - • - • - •   • 1
 3	|               |   |
 	• - •   • - • - •   • 2
 2	|   |       |       |
 	•   •   • - • - •   • 3
 1	|                   |
 	•   • - •   • - •   • 4
 0  |	    |   |       |
 	• - • - • - • - • - • 5
	  0	  1	  2   3   4	  (floor)
*/

bool navigateMaze(Robot &r, int targetx, int targety, int recursionDepth = 0) {
    const int W = 6;
    const int H = 6;

    // Check bounds
    if (r.getX() < 0 || r.getX() >= W || r.getY() < 0 || r.getY() >= H) throw "Robot start out of bounds.";
    if (targetx < 0 || targetx >= W || targety < 0 || targety >= H) throw "Target out of bounds.";

    // Base case: if we reached the target
    if (r.getX() == targetx && r.getY() == targety) {
        return true;
    }

    int x = r.getX();
    int y = r.getY();

	bool upWall =  maze_floors[H - 1 - (y + 1)][x]; 
	bool upBlocked = r.isBlocked(x, y + 1);
	bool downWall = maze_floors[H - 1 - y][x]; 
	bool downBlocked = r.isBlocked(x, y - 1);
	bool rightWall = maze_walls[H - 1 - (y + 1)][x + 1]; 
	bool rightBlocked = r.isBlocked(x + 1, y);
	bool leftWall = maze_walls[H - 1 - (y + 1)][x]; 
	bool leftBlocked = r.isBlocked(x - 1, y);

	//cout << "\nCurrent Position: (" << x << ", " << y << ")" << endl;
	//cout << "Up Block: " << upWall << " " << upBlocked << endl;
	//cout << "Down Block: " << downWall << " " << downBlocked << endl;
	//cout << "Right Block: " << rightWall << " " << rightBlocked << endl;
	//cout << "Left Block: " << leftWall << " " << leftBlocked << endl << endl;

	int countObs = (upWall || upBlocked) + (downWall || downBlocked) + (rightWall || rightBlocked) + (leftWall || leftBlocked);
	if (countObs == 3) {
		//cout << "Dead end at (" << x << ", " << y << ")\n";
		r.markBranchBlocked();
		return false;
	}

    // Up check
    if (y + 1 < H && !upWall && !upBlocked) {
		//cout << "Recursion Depth: " << recursionDepth << endl;
		//cout << "Trying up move..." << endl;
		Robot rCopy = r;
		rCopy.move('u');
		if (navigateMaze(rCopy, targetx, targety, recursionDepth + 1)) {
			//cout << "Up move successful." << endl;
			//cout << "Moving up to (" << x << ", " << y + 1 << ")\n";
			r.addMove("u");
			return true;
		}
		else {
			//cout << "Up move failed." << endl;
			r.markBranchBlocked();
		}
	}

    // Right check
	if (x + 1 < W && !rightWall && !rightBlocked) {
		//cout << "Recursion Depth: " << recursionDepth << endl;
		//cout << "Trying right move..." << endl;
        Robot rCopy = r;
        rCopy.move('r');
        if (navigateMaze(rCopy, targetx, targety, recursionDepth + 1)) {
			//cout << "Right move successful." << endl;
			//cout << "Moving right to (" << x + 1 << ", " << y << ")\n";
			r.addMove("r");
            return true;
        }
		else {
			//cout << "Right move failed." << endl;
			r.markBranchBlocked();
		}
    }

	// Down check
    if (y - 1 >= 0 && !downWall && !downBlocked) {
		//cout << "Recursion Depth: " << recursionDepth << endl;
		//cout << "Trying down move..." << endl;
        Robot rCopy = r;
        rCopy.move('d');
        if (navigateMaze(rCopy, targetx, targety, recursionDepth + 1)) {
			//cout << "Down move successful." << endl;
			//cout << "Moving down to (" << x << ", " << y - 1 << ")\n";
			r.addMove("d");
            return true;
        }
		else {
			//cout << "Down move failed." << endl;
			r.markBranchBlocked();
		}
    }
    // Left check
    if (x - 1 >= 0 && !leftWall && !leftBlocked) {
		//cout << "Recursion Depth: " << recursionDepth << endl;
		//cout << "Trying left move..." << endl;
        Robot rCopy = r;
        rCopy.move('l');
        if (navigateMaze(rCopy, targetx, targety, recursionDepth + 1)) {
			//cout << "Left move successful." << endl;
			//cout << "Moving left to (" << x - 1 << ", " << y << ")\n";
            r.addMove("l");
            return true;
        }
		else {
			//cout << "Left move failed." << endl;
			r.markBranchBlocked();
		}
    }
    return false;
}

int main() {
	try{
		Robot r(4,5);

		r.move('l');
		r.move('l');
		r.move('u');
		r.move('r');

		// Result is Robot at (3, 6)
		cout << "Result: " << r.getState() << endl;

		r.undo(1); // Robot at (2, 6)
		cout << "After undo: " << r.getState() << endl;

		r.undo(2); // Robot at (3, 5)
		cout << "After undo: " << r.getState() << endl;

		r.redo(1); // Robot at (2, 5)
		cout << "After redo: " << r.getState() << endl;

		//r.checkStacks();
		r.redo(1); // Robot at (2, 6)
		cout << "After redo: " << r.getState() << endl;

		//r.redo(2); // Uncommenting this statement should throw an error that no more redoes are possible
		//cout << "After redo: " << r.getState() << endl;

		r.undo(1); // Robot at (2, 5)
		cout << "After undo: " << r.getState() << endl;

		r.printAllOperations(); //Prints all the operations from the beginning

	}
	catch(const char* c){
		cout << c << endl;
	}

	try {
		cout << "\nTesting Maze Navigation:" << endl;
		Robot r2;
		bool success = navigateMaze(r2, 2, 2);
		cout << "Maze navigation " << (success ? "succeeded." : "failed.") << endl;
		r2.doMoves();
		cout << "Target Position: (2, 2)" << endl;
		cout << "Final Robot Position: " << r2.getState() << endl;
	}
	catch(const char* c){
		cout << c << endl;
	}
	return 0;
}
