import '../body_parameters.dart';

class Question3Model extends RequestBodyParameters {
  int? userId;
  int? q1;
  int? q21;
  int? q22;
  int? q23;
  int? q3;
  int? q4;
  int? q5;
  int? q6;
  int? q7;
  int? q8;
  int? q9;
  int? q10;
  int? total;

  Question3Model(
      {this.userId,
      this.q1,
      this.q21,
      this.q22,
      this.q23,
      this.q3,
      this.q4,
      this.q5,
      this.q6,
      this.q7,
      this.q8,
      this.q9,
      this.q10,
      this.total});

  Question3Model.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    q1 = json['q1'];
    q21 = json['q2_1'];
    q22 = json['q2_2'];
    q23 = json['q2_3'];
    q3 = json['q3'];
    q4 = json['q4'];
    q5 = json['q5'];
    q6 = json['q6'];
    q7 = json['q7'];
    q8 = json['q8'];
    q9 = json['q9'];
    q10 = json['q10'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['q1'] = q1;
    data['q2_1'] = q21;
    data['q2_2'] = q22;
    data['q2_3'] = q23;
    data['q3'] = q3;
    data['q4'] = q4;
    data['q5'] = q5;
    data['q6'] = q6;
    data['q7'] = q7;
    data['q8'] = q8;
    data['q9'] = q9;
    data['q10'] = q10;
    data['total'] = total;
    return data;
  }
}
