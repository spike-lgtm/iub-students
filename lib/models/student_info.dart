class StudentInfo {
  String name;
  String cgpa;
  String creditCompleted;

  StudentInfo({
    required this.name,
    required this.cgpa,
    required this.creditCompleted,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) {
    return StudentInfo(
      name: json['name'],
      cgpa: json['cgpa'],
      creditCompleted: json['credit_completed'],
    );
  }
}
