//payment class to handle the payment of the course fee by the student
import 'package:mahmoud_new/models/courses.dart';
import 'package:mahmoud_new/models/instrctor.dart';
import 'package:mahmoud_new/models/student.dart';

class Payment {
  final Student student;
  final Courses course;
  final Instrctor instructor;
  final DateTime paymentDate;

  Payment({
    required this.student,
    required this.course,
    required this.instructor,
    required this.paymentDate,
  });
  // functionalty to make payment for the course fee by the student
  void makePayment() {
    print(
      '${student.name} has paid ${course.courseFee} for ${course.courseName}',
    );
  }

  // functionalty to make the instructor take the payment for the course fee
  void receivePayment() {
    print(
      '${instructor.name} has received ${course.courseFee} for ${course.courseName}',
    );
  }
  //function to make the calculat all corses fee for the student
  int calculateTotalPayment() {
    int totalPayment = 0;
    for (String courseName in student.courses) {
      totalPayment += course.courseFee; // Add the course fee to the total payment
    }
    return totalPayment;
  }
  
}
