class StudentModel {
  final int id;
  final int studentCode;
  final String? name;
  final String? email;
  final String? college;
  final int? nationalId;
  final String? phoneNumber;
  final String role;

  const StudentModel({
    required this.id,
    required this.studentCode,
    this.name,
    this.email,
    this.college,
    this.nationalId,
    this.phoneNumber,
    required this.role,
  });

  /// Convert JSON → Model
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      studentCode: json['student_code'],
      name: json['name'],
      email: json['email'],
      college: json['college'],
      nationalId: json['national_id'],
      phoneNumber: json['phone_number'],
      role: json['role'] ?? 'student',
    );
  }

  /// Convert Model → JSON (useful for secure storage)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_code': studentCode,
      'name': name,
      'email': email,
      'college': college,
      'national_id': nationalId,
      'phone_number': phoneNumber,
      'role': role,
    };
  }
}
