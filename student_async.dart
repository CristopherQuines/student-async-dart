
abstract class Person {
  String name;

  Person(this.name);

  void showInformation();
}

mixin StudentActivities {
  void showActivities() {
    print('The student attends classes and completes assignments.');
  }
}

class Student extends Person with StudentActivities {
  String studentNumber;
  String course;

  Student(String name, this.studentNumber, this.course) : super(name);

  @override
  void showInformation() {
    print('Student Name: $name');
    print('Student Number: $studentNumber');
    print('Course: $course');
  }

  Future<String> saveStudentRecord() async {
    print('\nSaving student record...');

    await Future.delayed(Duration(seconds: 2));

    return 'Student record for $name saved successfully!';
  }
}

class CollegeStudent extends Student {
  String yearLevel;

  CollegeStudent(
    String name,
    String studentNumber,
    String course,
    this.yearLevel,
  ) : super(name, studentNumber, course);

  @override
  void showInformation() {
    super.showInformation();
    print('Year Level: $yearLevel');
  }
}

Future<void> main() async {
  CollegeStudent student = CollegeStudent(
    'Cristopher Quines',
    '425003374',
    'BSIT',
    '3rd Year',
  );

  print('=== STUDENT INFORMATION SYSTEM ===');

  student.showInformation();
  student.showActivities();

  print('\nPreparing to save the student record...');
  print('The program is waiting for the saving process.');

  String result = await student.saveStudentRecord();

  print(result);
  print('\nProgram finished.');
}

