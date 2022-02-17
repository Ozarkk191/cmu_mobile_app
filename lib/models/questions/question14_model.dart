import '../body_parameters.dart';

class QuestionModel14 extends RequestBodyParameters {
  int? userId;
  int? q1;
  int? q2;
  int? q3;
  int? q4;
  int? q5;
  int? q6;
  int? q7;
  int? q8;
  int? q9;
  int? q10;
  int? q11;
  int? q12;
  int? q13;
  int? q14;

  QuestionModel14({
    this.userId,
    this.q1 = 0,
    this.q2 = 0,
    this.q3 = 0,
    this.q4 = 0,
    this.q5 = 0,
    this.q6 = 0,
    this.q7 = 0,
    this.q8 = 0,
    this.q9 = 0,
    this.q10 = 0,
    this.q11 = 0,
    this.q12 = 0,
    this.q13 = 0,
    this.q14 = 0,
  });

  QuestionModel14.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    q1 = json['q1'];
    q2 = json['q2'];
    q3 = json['q3'];
    q4 = json['q4'];
    q5 = json['q5'];
    q6 = json['q6'];
    q7 = json['q7'];
    q8 = json['q8'];
    q9 = json['q9'];
    q10 = json['q10'];
    q11 = json['q11'];
    q12 = json['q12'];
    q13 = json['q13'];
    q14 = json['q14'];
  }

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
    data['q7'] = q7;
    data['q8'] = q8;
    data['q9'] = q9;
    data['q10'] = q10;
    data['q11'] = q11;
    data['q12'] = q12;
    data['q13'] = q13;
    data['q14'] = q14;

    return data;
  }
}
