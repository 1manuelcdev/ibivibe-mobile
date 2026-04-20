import 'package:ibiapabaapp/features/auth/validation/auth_validator.dart';

class RegisterFormData {
  String name;
  String username;
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;
  DateTime? birthDate;
  String role;

  RegisterFormData({
    this.name = '',
    this.username = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.birthDate,
    this.role = 'user',
  });

  factory RegisterFormData.fromMap(Map<String, dynamic> map) {
    return RegisterFormData(
      name: map[AuthFields.name.name] ?? '',
      username: map[AuthFields.username.name] ?? '',
      email: map[AuthFields.email.name] ?? '',
      phoneNumber: map[AuthFields.phoneNumber.name] ?? '',
      password: map[AuthFields.password.name] ?? '',
      confirmPassword: map[AuthFields.confirmPassword.name] ?? '',
      birthDate: _parseDate(map[AuthFields.birthDate.name]),
      role: map['role'] ?? 'user',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
      'password_confirm': confirmPassword,
      'birth_date': birthDate?.toIso8601String(),
      'role': role,
    };
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    try {
      final parts = value.toString().split('/');
      if (parts.length == 3) {
        return DateTime(
          int.parse(parts[2]), // Ano
          int.parse(parts[1]), // Mês
          int.parse(parts[0]), // Dia
        );
      }
    } catch (_) {}
    return null;
  }

  RegisterFormData copyWithField(AuthFields field, dynamic value) {
    return RegisterFormData(
      name: field == AuthFields.name ? value : name,
      username: field == AuthFields.username ? value : username,
      email: field == AuthFields.email ? value : email,
      phoneNumber: field == AuthFields.phoneNumber ? value : phoneNumber,
      password: field == AuthFields.password ? value : password,
      confirmPassword: field == AuthFields.confirmPassword
          ? value
          : confirmPassword,
      birthDate: field == AuthFields.birthDate ? value : birthDate,
      role: role,
    );
  }
}
