// File name: Sandoval8.cpp
// Author: Brandon Sandoval
// Course: CSCI-3160-D01
// Assignment: Homework 8
// Date: April 4th, 2023
// Purpose: This program will fill an array with user input and display the average, min, and max value.
#include <iostream>
using namespace std;

int getArray(int arr[], int size);
float computeAvg(int arr[], int size);
void maxMin(int arr[], int size, int& minVal, int& maxVal);

int main() {
   const int MAX_SIZE = 20;
   int arr[MAX_SIZE]={0};
   int minVal, maxVal;
   float avg;
   int arraySize;

   //Function calls
   arraySize=getArray(arr, MAX_SIZE);
   avg = computeAvg(arr, arraySize);
   maxMin(arr, arraySize, minVal, maxVal);


   //Print values
   cout << "The size of the array is " << arraySize << endl;
   cout << "The average value of the array is " << avg << endl;
   cout << "The maximum value of the array is " << maxVal << endl;
   cout << "The minimum value of the array is " << minVal << endl;
   

    

   return 0;
}

//Function to ask the user for number to be used in the array
int getArray(int arr[], int size) {
    int userNum;
    int arraySize=0;
    
    do {
      cout << "Enter a number (enter 0 to stop): ";
      cin >> userNum;

      // Add the entered number to the array if it's not 0
      if(userNum != 0) {
         arr[arraySize] = userNum;
         arraySize++;
      }

   } while(userNum != 0 && arraySize < size);

   return arraySize;
}

//Function to compute the average of the array
float computeAvg(int arr[], int size) {
   float sum = 0;
   
   
   for(int i = 0; i < size; i++) {
      sum += arr[i];
   }
   
   
   return sum / size;
}


//Function to find the minimum and maximum value of the array
void maxMin(int arr[], int size, int& minVal, int& maxVal) {
   minVal = arr[0];
   maxVal = arr[0];
   
   for(int i = 1; i < size; i++) {
      
      if(arr[i] < minVal) {
         minVal = arr[i];
      }
      
      if(arr[i] > maxVal) {
         maxVal = arr[i];
      }
   }
}
