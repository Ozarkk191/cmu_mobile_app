import 'package:cmu_mobile_app/models/body_parameters.dart';

class AllUserModel {
  String? message;
  Users? users;

  AllUserModel({this.message, this.users});

  AllUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (users != null) {
      data['users'] = users!.toJson();
    }
    return data;
  }
}

class Users {
  List<User>? student;
  List<User>? parent;
  List<User>? monk;
  List<User>? teacher;

  Users({this.student, this.parent, this.monk, this.teacher});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['student'] != null) {
      student = <User>[];
      json['student'].forEach((v) {
        student!.add(User.fromJson(v));
      });
    }
    if (json['parent'] != null) {
      parent = <User>[];
      json['parent'].forEach((v) {
        parent!.add(User.fromJson(v));
      });
    }
    if (json['monk'] != null) {
      monk = <User>[];
      json['monk'].forEach((v) {
        monk!.add(User.fromJson(v));
      });
    }
    if (json['teacher'] != null) {
      teacher = <User>[];
      json['teacher'].forEach((v) {
        teacher!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (student != null) {
      data['student'] = student!.map((v) => v.toJson()).toList();
    }
    if (parent != null) {
      data['parent'] = parent!.map((v) => v.toJson()).toList();
    }
    if (monk != null) {
      data['monk'] = monk!.map((v) => v.toJson()).toList();
    }
    if (teacher != null) {
      data['teacher'] = teacher!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User extends RequestBodyParameters {
  int? id;
  String? name;
  String? email;
  bool? emailVerifiedAt;
  int? studentId;
  String? role;
  int? branchId;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.studentId,
      this.role,
      this.branchId,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    studentId = json['student_id'];
    role = json['role'];
    branchId = json['branch_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['student_id'] = studentId;
    data['role'] = role;
    data['branch_id'] = branchId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
