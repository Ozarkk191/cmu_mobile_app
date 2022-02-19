class UserAuthModel {
  int? id;
  String? name;
  String? email;
  bool? emailVerifiedAt;
  int? studentId;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? branchId;

  UserAuthModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.studentId,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.branchId,
  });

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    studentId = int.parse(json['student_id'].toString());
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    branchId = json['branch_id'];
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
    data['branch_id'] = branchId;
    return data;
  }
}
