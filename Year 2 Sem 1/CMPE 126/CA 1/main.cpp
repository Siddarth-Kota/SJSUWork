#include <iostream>
#include <string>
#include "Animal.h"
#include "Animal.cpp"

using namespace std;

// Main function to test the classes
int main() {
    // Create an instance of Animal
    Animal genericAnimal("Generic", 5);
    cout << genericAnimal << endl;
    genericAnimal.makeSound();
    genericAnimal.playGame();
    genericAnimal.eatFood();

    // Create an instance of Dog
    Dog dog("Buddy", 3, "Golden Retriever");
    cout << dog << endl;
    dog.makeSound();
    cout << endl;
    dog.makeSound(2);
    dog.playGame();
    dog.eatFood();

    // Create an instance of Cat
    Cat cat("Whiskers", 2, "Black");
    cout << cat << endl;
    cat.makeSound();
    cout << endl;
    cat.makeSound(3);
    cat.playGame();
    cat.eatFood();

    // Additional testing
    // TODO: Set attributes using setters and test getters
    // TODO: Test polymorphism if desired

    return 0;
}