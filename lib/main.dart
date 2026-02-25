// the intery point of the app
import 'dart:io';

import 'package:mahmoud_new/data/studenData.dart';

///What you need to solve:

//🧠 Real system challenges
//1️⃣ Prevents a student from registering for a full course
//2️⃣ Prevents the same student from registering twice
//3️⃣ Calculates the company's total profits
//4️⃣ Calculates the instructor's salary based on a percentage of the course fees
//5️⃣ Generates a comprehensive management report*/
void main() {
  print('Welcome to the Course Management System!');
 //start to make the program that will give to user lest to make it chose the action that will do 
  print('Please choose an action:');
  print('1. Enroll a student in a course');
  print('2. Make a payment for a course');
  print('3. Generate a management report');
  // here you can add the functionality to take the user input and call the corresponding functions based on the user's choice    
  if (1 == 1) {
    print('You have chosen to enroll a student in a course');
    //start to make the program that will give to user lest to make it chose the action that will do
    //make the user select the course that wwill enroll in it and the student that will enroll in the course  
    print('Please choose a course to enroll in:');
    print('1. Math');
    print('2. Science');
    print('3. History');
    int courseChoise = int.parse(stdin.readLineSync()!);
    print('Please choose a student to enroll:');
    print('1. John Doe');
    print('2. Jane Smith');
    print('3. Alice Johnson');
    print('4. Bob Brown');
    print('5. Emily Davis');
    int instructorChoise = int.parse(stdin.readLineSync()!);
    // here you can add the functionality to take the user input and call the corresponding functions based
    // here you can add the functionality to enroll a student in a course
    // add the asudent to the coyrse and check if the course is full or not and check if the student is already enrolled in the course or not 
    // if the student is already enrolled in the course print that the student is already enrolled in the course
    // if the course is full print that the course is full
    // if the student is already enrolled in the course print that the student is already enrolled in the course
    // if the student is already enrolled in the course print that the student is already enrolled in the course
    if (courseChoise == 1 && instructorChoise == 1) {
      student1.enroll();
    }
    if (courseChoise == 2 && instructorChoise == 2) {
      student2.enroll();
    }
    if (courseChoise == 3 && instructorChoise == 3) {
      student3.enroll();
    }
    if (courseChoise == 4 && instructorChoise == 4) {
      student4.enroll();
    }
    if (courseChoise == 5 && instructorChoise == 5) {
      student5.enroll();
    }
    ///make the user select the course that wwill enroll in it and the student that will enroll in the course 
    /// here you can add the functionality to take the user input and call the corresponding functions based on the user's choice
    

  } else if (2 == 2) {
    print('You have chosen to make a payment for a course');

  } else if (3 == 3) {
    print('You have chosen to generate a management report');
  } else {
    print('Invalid choice. Please try again.');
  }
}