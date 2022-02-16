import 'body_parameters.dart';

class SignUpModel extends RequestBodyParameters {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? role;
  String? studentId;
  int? branchId;

  SignUpModel({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.role,
    this.studentId,
    this.branchId,
  });

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['role'] = role;
    data['student_id'] = studentId;
    data['branch_id'] = branchId;
    return data;
  }
}
