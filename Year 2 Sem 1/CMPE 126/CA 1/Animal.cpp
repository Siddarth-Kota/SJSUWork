#include "Animal.h"
#include <iostream>

using namespace std;
// Implementations of Animal class methods

// Default constructor
Animal::Animal() : name(""), age(0) {}

// Parameterized constructor
Animal::Animal(const std::string& name, int age) {
    this->name = name;
    this->age = age;
}

// Getter for name
std::string Animal::getName() const {
    return name;
}

// Setter for name
void Animal::setName(const std::string& name) {
    this->name = name;
}

// Getter for age
int Animal::getAge() const {
    return age;
}

// Setter for age
void Animal::setAge(int age) {
    this-> age = age;
}

// Virtual method makeSound()
void Animal::makeSound() const {
    cout << "Generic Sound" << endl;
}

//overloaded Function makeSound() (Additional Extension)
void Animal::makeSound(int times) const {
    for(int i = 0; i < times; i++) {
        this->makeSound();
    }
}

//virtual method playGame() (Additional Extension)
void Animal::playGame() const {
    cout << "Generic Game" << endl;
}

//virtual method eatFood() (Additional Extension)
void Animal::eatFood() const {
    cout << "Generic food" << endl;
}

void Animal::print(ostream& out) const {
    out << "Name: " << name << " | Age: " << age;
}


//Operator << overloading (Additional Extension)
ostream& operator<<(ostream& out, const Animal& a) {
    a.print(out);
    return out;
}

// Implementations of Dog class methods

// Default constructor
Dog::Dog() : Animal(), breed("") {}

// Parameterized constructor
Dog::Dog(const std::string& name, int age, const std::string& breed) : Animal(name, age) {
    this->breed = breed;
}

// Getter for breed
std::string Dog::getBreed() const {
    return breed;
}

// Setter for breed
void Dog::setBreed(const std::string& breed) {
    this->breed = breed;
}

// Override makeSound()
void Dog::makeSound() const {
    cout << "Woof" << endl;
}

//overloaded Function makeSound() (Additional Extension)
void Dog::makeSound(int times) const {
    Animal::makeSound(times);
}

// Override playGame() (Additional Extension)
void Dog::playGame() const {
    cout << "Fetch!" << endl;
}

// Override playGame() (Additional Extension)
void Dog::eatFood() const {
    cout << "Kibble" << endl;
}

//Override print()
void Dog::print(ostream& out) const {
    out << "Name: " << getName() << " | Age: " << getAge() << " | Breed: " << breed;
}

// Implementations of Cat class methods

// Default constructor
Cat::Cat() : Animal(), color("") {}

// Parameterized constructor
Cat::Cat(const std::string& name, int age, const std::string& color) : Animal(name, age) {
    this->color = color;
}

// Getter for color
std::string Cat::getColor() const {
    return color;
}

// Setter for color
void Cat::setColor(const std::string& color) {
    this->color = color;
}

// Override makeSound()
void Cat::makeSound() const {
    cout << "Meow" << endl;
}

//overloaded Function makeSound() (Additional Extension)
void Cat::makeSound(int times) const {
    Animal::makeSound(times);
}

//Override playGame() (Additional Extension)
void Cat::playGame() const {
    cout << "Follow the Laser!" << endl;
}

//Override playGame() (Additional Extension)
void Cat::eatFood() const {
    cout << "Fish" << endl;
}

//Override print()
void Cat::print(ostream& out) const {
    out << "Name: " << getName() << " | Age: " << getAge() << " | Color: " << color;
}