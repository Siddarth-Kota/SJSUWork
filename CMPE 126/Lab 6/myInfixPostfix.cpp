#include <iostream>
#include <sstream>
#include <string>
#include <stack>
#include <cctype>
#include <stdexcept>
#include <iomanip>

#include "arrayStack.h"

using namespace std;

int precedence(char op) {
	if (op == '+' || op == '-') return 1;
	if (op == '*' || op == '/') return 2;
	return 0;
}

bool isOperator(char c) {
	return c == '+' || c == '-' || c == '*' || c == '/';
}


string infixToPostfix(const string &infix) {
    //stack<char> st;
    ArrayStack<char> st;
    string output;
    string currentNumber;
    bool parsingNumber = false;

    for (size_t i = 0; i < infix.size(); ++i) {
        char c = infix[i];

        if (c == ' ' || c == '\t') {
            if (parsingNumber) {
                output += currentNumber + " ";
                currentNumber.clear();
                parsingNumber = false;
            }
            continue;
        }
        if (c == ';') continue;
        if (isdigit(c) || c == '.' || (c == '-' && (i == 0 || infix[i-1] == '(' || isspace(infix[i-1])) && i + 1 < infix.size() && (isdigit(infix[i+1]) || infix[i+1] == '.'))) {
            if (!parsingNumber) {
                if (!currentNumber.empty()) {
                    output += currentNumber + " ";
                    currentNumber.clear();
                }
                parsingNumber = true;
            }
            currentNumber += c;
            continue;
        } else if (parsingNumber) {
            output += currentNumber + " ";
            currentNumber.clear();
            parsingNumber = false;
        }
        if (isalpha(static_cast<unsigned char>(c))) {
            output.push_back(c);
            output.push_back(' ');
        }
        else if (c == '(') {
            st.push(c);
        }
        else if (c == ')') {
            while (!st.empty() && st.top() != '(') {
                output.push_back(st.top());
                output.push_back(' ');
                st.pop();
            }
            if (!st.empty() && st.top() == '(') st.pop();
        }
        else if (isOperator(c)) {
            if (c == '-' && (i == 0 || infix[i-1] == '(' || isspace(infix[i-1]))) {
                currentNumber = "-";
                parsingNumber = true;
                continue;
            }
            while (!st.empty() && isOperator(st.top()) && precedence(st.top()) >= precedence(c)) {
                output.push_back(st.top());
                output.push_back(' ');
                st.pop();
            }
            st.push(c);
        }
        else {
            throw invalid_argument(string("Invalid character in infix expression: ") + c);
        }
    }
    if (parsingNumber && !currentNumber.empty()) {
        output += currentNumber + " ";
    }
    while (!st.empty()) {
        if (st.top() != '(' && st.top() != ')') {
            output.push_back(st.top());
            output.push_back(' ');
        }
        st.pop();
    }
    while (!output.empty() && isspace(static_cast<unsigned char>(output.back()))) 
        output.pop_back();
    return output;
}

double evaluatePostFix(string expression) {
    //stack<double> st;
    ArrayStack<double> st;
    string sym;
    istringstream in(expression);
    while (in >> sym) {
        if (isdigit(sym[0]) || (sym[0] == '-' && sym.length() > 1 && isdigit(sym[1])) || 
            (sym[0] == '.' && sym.length() > 1) || (sym[0] == '-' && sym.length() > 1 && sym[1] == '.')) {
            try {
                double num = stod(sym);
                st.push(num);
            } catch (const exception& e) {
                throw invalid_argument("Invalid number format: " + sym);
            }
        }
        else if (isOperator(sym[0]) && sym.size() == 1) {
            if (st.size() < 2) {
                throw invalid_argument("Insufficient operands for operator " + sym);
            }
            double b = st.top(); st.pop();
            double a = st.top(); st.pop();
            double result;
            switch (sym[0]) {
                case '+': result = a + b; break;
                case '-': result = a - b; break;
                case '*': result = a * b; break;
                case '/':
                    if (b == 0) {throw invalid_argument("Division by zero");}
                    result = a / b; 
                    break;
                default:
                    throw invalid_argument("Unknown operator " + sym);
            }
            st.push(result);
        } 
        else {
            throw invalid_argument("Invalid token in postfix expression: " + sym);
        }
    }
    if (st.size() != 1) {
        throw invalid_argument("The postfix expression is invalid.");
    }
    return st.top();
}

int main() {
    cout << "fixing \"2 10 5 * +\" : " << evaluatePostFix("2 10 5 * +") << endl;
    cout << "fixing \"-2.5 3.7 +\" : " << evaluatePostFix("-2.5 3.7 +") << endl;
    string input;
    while (true) {
        try {
            cout << "Enter infix expression (or 'stop' to quit): ";
            getline(cin, input);
            if (input == "stop") {return 1;}
            string postfix = infixToPostfix(input);
            cout << "Postfix: " << postfix << endl;
            double result = evaluatePostFix(postfix);
            cout << "Result: " << result << endl;
        } catch (const exception &e) {
            cout << "Error: " << e.what() << endl;
        }
    }
    return 0;
}