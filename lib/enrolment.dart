//the enrolment of the student in the course
import 'package:mahmoud_new/models/courses.dart';
import 'package:mahmoud_new/models/instrctor.dart';
import 'package:mahmoud_new/models/student.dart';
class Enrolment {
  final Student student;
  final Courses course;
  final Instrctor instructor;
  final DateTime enrolmentDate;

  Enrolment({
    required this.student,
    required this.course,
    required this.instructor,
    required this.enrolmentDate,
  });

  // functionalty to enrol a student in a course
  void enrol() {
    if
     (course.studentsEnrolled.length < course.limitOfStudents) {
      course.studentsEnrolled.add(student.name);
      print('${student.name} has been enrolled in ${course.courseName}');
    } else {
      print('Sorry, ${course.courseName} is full. ${student.name} cannot be enrolled.');
    }
  }
  ///the payment of the course fee by the student
  void makePayment() {
    print('${student.name} has paid ${course.courseFee} for ${course.courseName}');
  }
}