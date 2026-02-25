class Student {
  final String name;
  final int age;
  final String grade;
  final List<String> courses ;
  final int totalPayment ;
  int geneeratedId = 1000;

  Student({
    required this.name,
     required this.age, 
     required this.grade,
     required this.courses,
     });
  int generateId() {
    geneeratedId++;
    return geneeratedId;
  }
}