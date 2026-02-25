class Instrctor {
  String name;
  String email;
  String phone;
  int salary;
  List<String> courses ;
  @override
  String toString() {
    return 'Instrctor{name: $name, email: $email, phone: $phone, salary: $salary}';
  }

  Instrctor({
    required this.name,
     required this.email, 
     required this.phone, 
     required this.salary,
      required this.courses
      });
}
