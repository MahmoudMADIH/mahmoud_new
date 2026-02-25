class Courses {
  String courseName;
  String courseCode;
  String courseDescription;
  //instructor name
  String instructorName;
  int courseFee;
  List<String> studentsEnrolled ;
  int limitOfStudents = 30;

  Courses({
    required this.courseName,
    required this.courseCode,
    required this.courseDescription,
    required this.instructorName,
    required this.courseFee,
    required this.studentsEnrolled, required int limitOfStudents,
  });
}