/*
File Name: Sandoval6.cpp
Author: Brandon Sandoval
Course: CSCI 3160-D01
Date Done: 3/3/2023
Purpose: Four different programs to help in creating the Assembly programs
*/

#include <iostream>
using namespace std;

// Function declarations
void Min_Max_Program();
void Greatest_Common_Divisor_Program();
void Factorial_Limit_Program();
void Binomial_Coefficient_Program();


// Helper functions for the Binomial Coefficient Program
int binomialCoefficient(int n, int k);
int factorial(int n);




int main(){

    // Program flow
    cout<<"Minimum / Maximum Program"<<endl;
    Min_Max_Program();

    cout<<"Greatest Common Divisor Program"<<endl;
    Greatest_Common_Divisor_Program();

    cout<<"Factorial Limit Program"<<endl;
    Factorial_Limit_Program();

    cout<<"Binomial Coefficient Program"<<endl;
    Binomial_Coefficient_Program();

    return 0;
}

// Function to find minimum and maximum of three numbers
void Min_Max_Program(){

    int userNum1, userNum2, userNum3;
    int min,max;

    // Take input from the user for three numbers
    cout<<"Enter three numbers: ";
    cin>>userNum1;
    cin>>userNum2;
    cin>>userNum3;

    // Display the user's input values for the three numbers
    cout<<"Number 1: "<<userNum1<<endl;
    cout<<"Number 2: "<<userNum2<<endl;
    cout<<"Number 3: "<<userNum3<<endl;

    // Find the minimum among the three numbers
    if (userNum1 < userNum2 && userNum1 < userNum3) {
        min = userNum1;
    } else if (userNum2 < userNum3) {
        min = userNum2;
    } else {
        min = userNum3;
    }

    // Find the maximum among the three numbers
    if (userNum1 > userNum2 && userNum1 > userNum3) {
        max = userNum1;
    } else if (userNum2 > userNum3) {
        max = userNum2;
    } else {
        max = userNum3;
    }

    // Display the maximum and minimum of the three numbers
    cout<<endl;
    cout<<"Maximum: "<<max<<endl;
    cout<<"Minimum: "<<min<<endl;

    // Add extra line for spacing
    cout<<endl;

}

// Function to find the greatest common divisor of two numbers
void Greatest_Common_Divisor_Program(){

    int userA, userB;
    int remainder;
    int printA, printB;

    // Take input from the user for A and B
    cout << "Assuming A >= B" << endl;
    cout << "Enter A: "; 
    cin >> userA;
    cout << "Enter B: "; 
    cin >> userB;

    // Display the user's input values for A and B
    cout << "User chose " << userA << " as A and " << userB << " as B" << endl;

    // Save the original input values for printing later
    printA = userA;
    printB = userB;

    // Implement Euclid's algorithm to find GCD
    do {
        remainder = userA % userB;
        userA = userB;
        userB = remainder;
    } while (remainder != 0);

    // Display the GCD of the input values for A and B
    cout << "Greatest Common Divisor between " << printA << " and " << printB << " is " << userA << endl;

    // Add extra line for spacing
    cout<<endl;
}

// Function to find the largest factorial below a user input limit
void Factorial_Limit_Program(){

    int userLimit;

    int factorial = 1, m = 1;

    // Take input from the user for the factorial limit
    cout<<"Input factorial limit: ";
    cin>>userLimit;

    // Calculate the largest factorial below the user input limit
    while (factorial <= userLimit) {
        m++;
        factorial *= m;
    }

    // Display the largest factorial and m value
    cout << "Factorial: " << factorial/m << ", m: " << m-1 << endl;

    // Add extra line for spacing
    cout<<endl;
}

// Function to find the Binomial Coefficient given n and k
void Binomial_Coefficient_Program(){

    int userN, userK;
    
    // Take input from the user for n and k
    cout<<"Where n choose k, enter n: ";
    cin>>userN;

    cout<<"Enter k: ";
    cin>>userK;

    // Calculate and display the binomial coefficient of n choose k
    cout<<"The binomial coefficient of "<<userN<<" choose "<<userK<<" is: "<<binomialCoefficient(userN,userK)<<endl;

    // Add extra line for spacing
    cout<<endl;    
}

// This function calculates the binomial coefficient of n choose k
int binomialCoefficient(int n, int k){

    // Calculate the binomial coefficient using the formula
    return factorial(n)/(factorial(k) * factorial(n-k));
}

// This function calculates the factorial of a number
int factorial(int n){

    // If n is 0, return 1
    if(n==0){
        return 1;
    }

    // Calculate the factorial of n using recursion
    return n * factorial(n-1);
}
