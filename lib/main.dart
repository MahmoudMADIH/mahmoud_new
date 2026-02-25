// Entry point of the Course Management System
import 'dart:io';

import 'package:mahmoud_new/data/coursesData.dart';
import 'package:mahmoud_new/data/instructorData.dart';
import 'package:mahmoud_new/data/studenData.dart';
import 'package:mahmoud_new/models/courses.dart';
import 'package:mahmoud_new/models/instrctor.dart';
import 'package:mahmoud_new/models/student.dart';

// ─────────────────────────────────────────────
//  Helper utilities
// ─────────────────────────────────────────────

void printDivider([String title = '']) {
  if (title.isEmpty) {
    print('─' * 55);
  } else {
    final pad = ((55 - title.length - 2) / 2).floor();
    final line = '─' * pad;
    print('$line $title $line');
  }
}

int readInt(String prompt, {int min = 1, int max = 999}) {
  while (true) {
    stdout.write(prompt);
    final raw = stdin.readLineSync()?.trim() ?? '';
    final value = int.tryParse(raw);
    if (value != null && value >= min && value <= max) return value;
    print('  ⚠️  Please enter a number between $min and $max.');
  }
}

void listCourses() {
  for (int i = 0; i < allCourses.length; i++) {
    final c = allCourses[i];
    print(
      '  ${i + 1}. ${c.courseName} '
      '| Fee: \$${c.courseFee} '
      '| Enrolled: ${c.studentsEnrolled.length}/${c.limitOfStudents} '
      '| Instructor: ${c.instructorName}',
    );
  }
}

void listStudents() {
  for (int i = 0; i < allStudents.length; i++) {
    final s = allStudents[i];
    final enrolled = s.enrolledCourses.isEmpty
        ? 'none'
        : s.enrolledCourses.join(', ');
    print(
      '  ${i + 1}. ${s.name} (ID: ${s.studentId}) | Grade: ${s.grade} | Courses: $enrolled',
    );
  }
}

// ─────────────────────────────────────────────
//  ✅ Challenge 1 & 2 – Enrol student in course
//     Prevents full-course enrolment  (ch.1)
//     Prevents duplicate enrolment    (ch.2)
// ─────────────────────────────────────────────

void handleEnrolment() {
  printDivider('Enrol a Student');

  print('\nAvailable Courses:');
  listCourses();
  final courseIdx =
      readInt(
        'Select course (1-${allCourses.length}): ',
        max: allCourses.length,
      ) -
      1;
  final Courses selectedCourse = allCourses[courseIdx];

  print('\nAvailable Students:');
  listStudents();
  final studentIdx =
      readInt(
        'Select student (1-${allStudents.length}): ',
        max: allStudents.length,
      ) -
      1;
  final Student selectedStudent = allStudents[studentIdx];

  // ── Guard 1: course full? ──────────────────────────────────────
  // ── Guard 2: already enrolled? ────────────────────────────────
  final success = selectedCourse.enrollStudent(selectedStudent.name);

  if (success) {
    // Keep student's own course list in sync
    selectedStudent.enrolledCourses.add(selectedCourse.courseName);
    // Charge the fee
    selectedStudent.totalPayment += selectedCourse.courseFee;
    print(
      '   💰 \$${selectedCourse.courseFee} added to ${selectedStudent.name}\'s account '
      '(total: \$${selectedStudent.totalPayment}).',
    );
  }
}

// ─────────────────────────────────────────────
//  ✅ Challenge 3 – Company total profits
// ─────────────────────────────────────────────

int calcTotalProfits() {
  int total = 0;
  for (final course in allCourses) {
    total += course.studentsEnrolled.length * course.courseFee;
  }
  return total;
}

// ─────────────────────────────────────────────
//  ✅ Challenge 4 – Instructor salary (% of fees)
// ─────────────────────────────────────────────

/// Each instructor earns their base salary PLUS [percentage] of the
/// total fees collected from the course(s) they teach.
double calcInstructorEarnings(
  Instrctor instructor, {
  double percentage = 0.30,
}) {
  int feesCollected = 0;
  for (final courseName in instructor.coursesTaught) {
    final match = allCourses.where((c) => c.courseName == courseName);
    if (match.isNotEmpty) {
      final c = match.first;
      feesCollected += c.studentsEnrolled.length * c.courseFee;
    }
  }
  return instructor.salary + feesCollected * percentage;
}

// ─────────────────────────────────────────────
//  ✅ Challenge 5 – Comprehensive management report
// ─────────────────────────────────────────────

void generateReport() {
  printDivider('MANAGEMENT REPORT');

  // ── Course overview ──────────────────────────────────────────
  print('\n📚 COURSES');
  printDivider();
  for (final c in allCourses) {
    print('  Course  : ${c.courseName} (${c.courseCode})');
    print('  Desc    : ${c.courseDescription}');
    print('  Fee     : \$${c.courseFee}');
    print('  Limit   : ${c.limitOfStudents}');
    print('  Instructor: ${c.instructorName}');
    if (c.studentsEnrolled.isEmpty) {
      print('  Students: (none enrolled)');
    } else {
      print('  Students: ${c.studentsEnrolled.join(', ')}');
    }
    print(
      '  Status  : ${c.isFull() ? "🔴 FULL" : "🟢 Open (${c.limitOfStudents - c.studentsEnrolled.length} seat(s) left)"}',
    );
    printDivider();
  }

  // ── Student overview ─────────────────────────────────────────
  print('\n🎓 STUDENTS');
  printDivider();
  for (final s in allStudents) {
    print('  Name    : ${s.name}  (ID: ${s.studentId})');
    print('  Age     : ${s.age}  | Grade: ${s.grade}');
    final enrolled = s.enrolledCourses.isEmpty
        ? 'none'
        : s.enrolledCourses.join(', ');
    print('  Courses : $enrolled');
    print('  Paid    : \$${s.totalPayment}');
    printDivider();
  }

  // ── Instructor salaries (Challenge 4) ────────────────────────
  print('\n👨‍🏫 INSTRUCTOR EARNINGS  (base salary + 30% of course fees)');
  printDivider();
  for (final inst in allInstructors) {
    final earnings = calcInstructorEarnings(inst);
    print('  ${inst.name}');
    print('  Email   : ${inst.email}  | Phone: ${inst.phone}');
    print('  Courses : ${inst.coursesTaught.join(', ')}');
    print('  Base salary  : \$${inst.salary}');
    print('  Total earnings: \$${earnings.toStringAsFixed(2)}');
    printDivider();
  }

  // ── Company profits (Challenge 3) ────────────────────────────
  final profits = calcTotalProfits();
  print('\n🏢 COMPANY TOTAL PROFITS');
  printDivider();
  for (final c in allCourses) {
    final revenue = c.studentsEnrolled.length * c.courseFee;
    print('  ${c.courseName.padRight(10)}: ${c.studentsEnrolled.length} student(s) × \$${ c.courseFee} = \$$revenue');
  }
  final divLine = '─' * 45;
  print('  $divLine');
  print('  Total Revenue : \$$profits');

  // Deduct instructor bonus (30% of fees goes to instructors)
  double totalInstructorBonus = 0;
  for (final inst in allInstructors) {
    for (final courseName in inst.coursesTaught) {
      final match = allCourses.where((c) => c.courseName == courseName);
      if (match.isNotEmpty) {
        totalInstructorBonus +=
            match.first.studentsEnrolled.length * match.first.courseFee * 0.30;
      }
    }
  }
  final netProfit = profits - totalInstructorBonus;
  print('  Instructor Bonuses  : \$${totalInstructorBonus.toStringAsFixed(2)}');
  print('  ✅ Net Company Profit: \$${netProfit.toStringAsFixed(2)}');
  printDivider();
}

// ─────────────────────────────────────────────
//  Main – interactive menu loop
// ─────────────────────────────────────────────

void main() {
  printDivider('Course Management System');
  print(
    '  Welcome! All 5 system challenges are active:\n'
    '  1️⃣  Prevents enrolment in a FULL course\n'
    '  2️⃣  Prevents DUPLICATE enrolment\n'
    '  3️⃣  Calculates company TOTAL PROFITS\n'
    '  4️⃣  Calculates INSTRUCTOR salary (base + 30% of fees)\n'
    '  5️⃣  Generates a comprehensive MANAGEMENT REPORT',
  );
  printDivider();

  while (true) {
    print('\n📋 MAIN MENU');
    print('  1. Enrol a student in a course');
    print('  2. View all courses');
    print('  3. View all students');
    print('  4. Generate management report');
    print('  5. Exit');

    final choice = readInt('Enter your choice (1-5): ', max: 5);

    switch (choice) {
      case 1:
        handleEnrolment();
        break;
      case 2:
        printDivider('All Courses');
        listCourses();
        break;
      case 3:
        printDivider('All Students');
        listStudents();
        break;
      case 4:
        generateReport();
        break;
      case 5:
        print('\n👋 Goodbye! See you next time.');
        return;
    }
  }
}
