import 'package:mahmoud_new/models/instrctor.dart';

final Instrctor instructor1 = Instrctor(
  name: 'Dr. Ahemed',
  email: 'smith@university.edu',
  phone: '123-456-7890',
  salary: 75000,
  coursesTaught: ['Math'],
);

final Instrctor instructor2 = Instrctor(
  name: 'Dr. samh',
  email: 'johnson@university.edu',
  phone: '987-654-3210',
  salary: 80000,
  coursesTaught: ['Science'],
);

final Instrctor instructor3 = Instrctor(
  name: 'Dr. waled',
  email: 'williams@university.edu',
  phone: '555-555-5555',
  salary: 70000,
  coursesTaught: ['History'],
);

/// All instructors in a list for easy iteration
final List<Instrctor> allInstructors = [instructor1, instructor2, instructor3];
