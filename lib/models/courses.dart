class Courses {
  String courseName;
  String courseCode;
  String courseDescription;
  String instructorName;
  int courseFee;
  List<String> studentsEnrolled;
  int limitOfStudents;

  Courses({
    required this.courseName,
    required this.courseCode,
    required this.courseDescription,
    required this.instructorName,
    required this.courseFee,
    required this.studentsEnrolled,
    required this.limitOfStudents,
  });

  /// ✅ Challenge 1 – Prevents a student from registering for a FULL course
  bool isFull() => studentsEnrolled.length >= limitOfStudents;

  /// ✅ Challenge 2 – Prevents the SAME student from registering TWICE
  bool isAlreadyEnrolled(String studentName) =>
      studentsEnrolled.contains(studentName);

  /// Enrol a student with both guards applied
  bool enrollStudent(String studentName) {
    if (isFull()) {
      print(
        '❌ Sorry, "$courseName" is full '
        '(${studentsEnrolled.length}/$limitOfStudents). '
        '$studentName cannot be enrolled.',
      );
      return false;
    }
    if (isAlreadyEnrolled(studentName)) {
      print('⚠️  $studentName is already enrolled in "$courseName".');
      return false;
    }
    studentsEnrolled.add(studentName);
    print('✅ $studentName has been successfully enrolled in "$courseName".');
    return true;
  }
}
