class Student {
  final String name;
  final int age;
  final String grade;
  List<String> enrolledCourses; // mutable – courses added at runtime
  int totalPayment;
  static int _idCounter = 1000;
  final int studentId;

  Student({
    required this.name,
    required this.age,
    required this.grade,
    List<String>? enrolledCourses,
    this.totalPayment = 0,
  }) : enrolledCourses = enrolledCourses ?? [],
       studentId = ++_idCounter;

  @override
  String toString() => 'Student{id: $studentId, name: $name}';
}
