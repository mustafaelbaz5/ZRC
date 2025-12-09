import 'dart:convert';

class UserModel {
  final int id;
  final int studentCode;
  final String name;
  final String email;

  final String? college;
  final int? nationalId;
  final String? phoneNumber;
  final String role;

  UserModel({
    required this.id,
    required this.studentCode,
    required this.name,
    required this.email,

    this.college,
    this.nationalId,
    this.phoneNumber,
    required this.role,
  });

  factory UserModel.fromJson(final Map<String, dynamic> json) => UserModel(
    id: json['id'],
    studentCode: json['student_code'],
    name: json['name'] ?? '',
    email: json['email'] ?? '',
    college: json['college'],
    nationalId: json['national_id'],
    phoneNumber: json['phone_number'],
    role: json['role'] ?? 'student',
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'student_code': studentCode,
    'name': name,
    'email': email,
    'college': college,
    'national_id': nationalId,
    'phone_number': phoneNumber,
    'role': role,
  };

  // helper to convert to json string for storage
  String toJsonString() => jsonEncode(toJson());

  // helper to create model from json string from storage
  factory UserModel.fromJsonString(final String jsonString) =>
      UserModel.fromJson(jsonDecode(jsonString));
}
