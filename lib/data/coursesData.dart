import 'package:mahmoud_new/models/courses.dart';

final Courses course1 = Courses(
  courseName: 'Math',
  courseCode: 'MATH101',
  courseDescription: 'Basic Mathematics',
  instructorName: 'Dr. Smith',
  courseFee: 100,
  limitOfStudents: 3,
  studentsEnrolled: [],
);

final Courses course2 = Courses(
  courseName: 'Science',
  courseCode: 'SCI101',
  courseDescription: 'Basic Science',
  instructorName: 'Dr. Johnson',
  courseFee: 150,
  limitOfStudents: 3,
  studentsEnrolled: [],
);

final Courses course3 = Courses(
  courseName: 'History',
  courseCode: 'HIST101',
  courseDescription: 'Basic History',
  instructorName: 'Dr. Williams',
  courseFee: 120,
  limitOfStudents: 3,
  studentsEnrolled: [],
);

/// All courses in a list for easy iteration
final List<Courses> allCourses = [course1, course2, course3];
