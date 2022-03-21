abstract class RequestBodyParameters {
  // Converts the object into JSON.
  Map<String, dynamic> toJson();
}

class LoginParameter extends RequestBodyParameters {
  String email;
  String password;

  LoginParameter({required this.email, required this.password});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class ChildrenModel extends RequestBodyParameters {
  int userId;

  ChildrenModel({required this.userId});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    return data;
  }
}

class ResetPasswordModel extends RequestBodyParameters {
  int userId;
  String password;

  ResetPasswordModel({
    required this.userId,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['password'] = password;
    return data;
  }
}
