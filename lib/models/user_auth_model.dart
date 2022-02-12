class UserAuthModel {
  int? id;
  String? name;
  String? email;
  bool? emailVerifiedAt;
  String? studentId;
  String? role;
  String? createdAt;
  String? updatedAt;

  UserAuthModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.studentId,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    studentId = json['student_id'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['student_id'] = studentId;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
