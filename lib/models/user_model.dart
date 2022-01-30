class UserModel {
  String? firstname;
  String? lastname;
  String? age;
  String? group;
  String? gender;
  String? email;
  String? phone;
  String? address;
  String? regisDate;
  String? namePrefix;
  String? role;
  String? profileUrl;

  UserModel({
    this.firstname,
    this.lastname,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.address,
    this.regisDate,
    this.namePrefix,
    this.group,
    this.role,
    this.profileUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    regisDate = json['regisDate'];
    namePrefix = json['namePrefix'];
    group = json['group'];
    role = json['role'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['age'] = age;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['regisDate'] = regisDate;
    data['namePrefix'] = namePrefix;
    data['group'] = group;
    data['role'] = role;
    data['profileUrl'] = profileUrl;
    return data;
  }
}
