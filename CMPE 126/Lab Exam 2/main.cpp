//============================================================================
// Name        : main.cpp
// Author      : Mahima
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
#include <utility>
#include <functional>

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

 • - • - • - • - • - • 
 |                   |
 • - • - • - • - •   •
 |               |   |
 • - •   • - • - •   •
 |   |       |       |
 •   •   • - • - •   •
 |                   |
 •   • - •   • - •   •
 |	     |   |       |
 • - • - • - • - • - •

*/

void navigateMaze(Robot &r, int targetx, int targety) {
	const int W = 6;
	const int H = 6;

	if (r.getX() < 0 || r.getX() >= W || r.getY() < 0 || r.getY() >= H) throw "Robot start out of bounds.";
	if (targetx < 0 || targetx >= W || targety < 0 || targety >= H) throw "Target out of bounds.";

	bool visited[H][W] = {false};
	pair<int,int> prev[H][W];
	for (int iy = 0; iy < H; ++iy) for (int ix = 0; ix < W; ++ix) prev[iy][ix] = {-1,-1};

	queue<pair<int,int>> q;
	q.push({r.getX(), r.getY()});
	visited[r.getY()][r.getX()] = true;
	bool found = false;

	while (!q.empty()) {
		pair<int,int> cur = q.front(); 
		q.pop();
		int x = cur.first, y = cur.second;
		if (x == targetx && y == targety) { found = true; break; }

		// Up
		if (y + 1 < H && !visited[y+1][x]) {
			if (maze_walls[y][x] == 0) {
				visited[y+1][x] = true;
				prev[y+1][x] = {x,y};
				q.push({x, y+1});
			}
		}

		// Down
		if (y - 1 >= 0 && !visited[y-1][x]) {
			if (maze_walls[y-1][x] == 0) {
				visited[y-1][x] = true;
				prev[y-1][x] = {x,y};
				q.push({x, y-1});
			}
		}

		// Right
		if (x + 1 < W && !visited[y][x+1]) {
			if (maze_floors[H - 1 - y][x] == 0) {
				visited[y][x+1] = true;
				prev[y][x+1] = {x,y};
				q.push({x+1, y});
			}
		}

		// Left
		if (x - 1 >= 0 && !visited[y][x-1]) {
			if (maze_floors[H - 1 - y][x-1] == 0) {
				visited[y][x-1] = true;
				prev[y][x-1] = {x,y};
				q.push({x-1, y});
			}
		}
	}

	if (!found) throw "No path found.";

	// Reconstruct path and execute moves on the robot
	vector<char> moves;
	int cx = targetx, cy = targety;
	int sx = r.getX();
	int sy = r.getY();
	while (!(cx == sx && cy == sy)) {
		auto p = prev[cy][cx];
		int px = p.first, py = p.second;
		if (px == -1) break;
		if (px == cx && py + 1 == cy) moves.push_back('u');
		else if (px + 1 == cx && py == cy) moves.push_back('r');
		else if (px == cx && py - 1 == cy) moves.push_back('d');
		else if (px - 1 == cx && py == cy) moves.push_back('l');
		else throw "Invalid path reconstruction.";
		cx = px; cy = py;
	}
	reverse(moves.begin(), moves.end());

	cout << "Found path of length " << moves.size() << ": ";
	for (char c : moves) cout << c << ' ';
	cout << endl;

	for (char m : moves) {
		r.move(m);
		cout << "Moved " << m << ": " << r.getState() << endl;
	}
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

	try{

		Robot r2;
		navigateMaze(r2, 2, 2);
	}
	catch(const char* c){
		cout << c << endl;
	}
	return 0;
}
