class Student {
  String _stdname = "";
  int _cms = 0;

  Student(this._stdname, this._cms);

  String get stdname => _stdname;
  int get cms => _cms;

  String calculateGrade(double percentage) {
    if (percentage < 0) {
      return 'Invalid input!';
    }

    if (percentage >= 80 && percentage <= 100) {
      return "$stdname of $cms got an A grade!";
    } else if (percentage >= 60 && percentage < 80) {
      return "$stdname of $cms got a B grade!";
    } else {
      return "$stdname of $cms got a C grade!";
    }
  }
}

void main() {
  Student s1 = Student("Abdullah Khan", 514779);
  Student s2 = Student("Zain Khan", 523125);
  Student s3 = Student("Diyan Gahni Khan", 515424);

  print(s1.calculateGrade(82.1));
  print(s2.calculateGrade(92.1));
  print(s3.calculateGrade(52.1));
}
 