import '../body_parameters.dart';

class ReflexModel extends RequestBodyParameters {
  int? userId;
  String? q1;
  String? q2;

  ReflexModel({this.userId, this.q1, this.q2});

  ReflexModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    q1 = json['q1'];
    q2 = json['q2'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['q1'] = q1;
    data['q2'] = q2;
    return data;
  }
}
