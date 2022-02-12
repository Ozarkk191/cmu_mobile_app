abstract class RequestBodyParameters {
  // Converts the object into JSON.
  Map<String, dynamic> toJson();
}

class LoginParameter extends RequestBodyParameters{
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
