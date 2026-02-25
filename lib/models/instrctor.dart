class Instrctor {
  String name;
  String email;
  String phone;

  /// Base/fixed salary set by the company
  int salary;
  List<String> coursesTaught;

  Instrctor({
    required this.name,
    required this.email,
    required this.phone,
    required this.salary,
    required this.coursesTaught,
  });

  /// ✅ Challenge 4 – Instructor salary = base + percentage of all course fees
  /// [courseFees]  : list of fees for every course the instructor teaches
  /// [percentage]  : e.g. 0.30 means the instructor earns 30% of course fees
  double computeEarnings(List<int> courseFees, {double percentage = 0.30}) {
    int totalFees = courseFees.fold(0, (sum, fee) => sum + fee);
    return salary + (totalFees * percentage);
  }

  @override
  String toString() =>
      'Instrctor{name: $name, email: $email, phone: $phone, salary: $salary}';
}
