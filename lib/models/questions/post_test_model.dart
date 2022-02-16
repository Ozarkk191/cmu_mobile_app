import '../body_parameters.dart';

class PostTestModel extends RequestBodyParameters {
  int? userId;
  int q1;
  int q2;
  int q3;
  int q4;
  int q5;
  int q6;
  int? total;

  PostTestModel({
    this.userId,
    this.q1 = 0,
    this.q2 = 0,
    this.q3 = 0,
    this.q4 = 0,
    this.q5 = 0,
    this.q6 = 0,
    this.total,
  });

  PostTestModel.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        q1 = json['q1'],
        q2 = json['q2'],
        q3 = json['q3'],
        q4 = json['q4'],
        q5 = json['q5'],
        q6 = json['q6'],
        total = json['total'];

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['q1'] = q1;
    data['q2'] = q2;
    data['q3'] = q3;
    data['q4'] = q4;
    data['q5'] = q5;
    data['q6'] = q6;
    data['total'] = total;
    return data;
  }
}
