#ifndef ANIMAL_H
#define ANIMAL_H

#include <string>
#include <iostream>

using namespace std;

// Base class
class Animal {
private:
    std::string name;
    int age;

protected:

    //virtual method print()
    virtual void print(ostream& out) const;

public:
    // Default constructor
    Animal();

    // Parameterized constructor
    Animal(const std::string& name, int age);

    // Getter for name
    std::string getName() const;

    // Setter for name
    void setName(const std::string& name);

    // Getter for age
    int getAge() const;

    // Setter for age
    void setAge(int age);

    // Virtual method makeSound()
    virtual void makeSound() const;

    //overloaded Function makeSound()
    void makeSound(int times) const;

    //virtual method playGame()
    virtual void playGame() const;

    //virtual method eatFood()
    virtual void eatFood() const;

    //operator overload <<
    friend ostream& operator<<(ostream& out, const Animal& a);
};

// Derived class Dog
class Dog : public Animal {
private:
    std::string breed;

protected:

    //Override method print()
    void print(ostream& out) const override;

public:
    // Default constructor
    Dog();

    // Parameterized constructor
    Dog(const std::string& name, int age, const std::string& breed);

    // Getter for breed
    std::string getBreed() const;

    // Setter for breed
    void setBreed(const std::string& breed);

    // Override makeSound()
    void makeSound() const override;

    //overloaded Function makeSound()
    void makeSound(int times) const;

    //Override playGame()
    void playGame() const override;

    //Override eatFood()
    void eatFood() const override;
};

// Derived class Cat
class Cat : public Animal {
private:
    std::string color;

protected:

    //Override method print()
    void print(ostream& out) const override;

public:
    // Default constructor
    Cat();

    // Parameterized constructor
    Cat(const std::string& name, int age, const std::string& color);

    // Getter for color
    std::string getColor() const;

    // Setter for color
    void setColor(const std::string& color);

    // Override makeSound()
    void makeSound() const override;

    //overloaded Function makeSound()
    void makeSound(int times) const;

    //Override playGame()
    void playGame() const override;

    //Override eatFood()
    void eatFood() const override;
};

#endif //ANIMAL_H