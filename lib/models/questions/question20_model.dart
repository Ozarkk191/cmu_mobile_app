import '../body_parameters.dart';

class QuestionModel20 extends RequestBodyParameters {
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
  int? q15;
  int? q16;
  int? q17;
  int? q18;
  int? q19;
  int? q20;
  String? type;

  QuestionModel20({
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
    this.q15 = 0,
    this.q16 = 0,
    this.q17 = 0,
    this.q18 = 0,
    this.q19 = 0,
    this.q20 = 0,
    this.type = "",
  });

  QuestionModel20.fromJson(Map<String, dynamic> json) {
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
    q15 = json['q15'];
    q16 = json['q16'];
    q17 = json['q17'];
    q18 = json['q18'];
    q19 = json['q19'];
    q20 = json['q20'];
    type = json['type'];
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
    data['q15'] = q15;
    data['q16'] = q16;
    data['q17'] = q17;
    data['q18'] = q18;
    data['q19'] = q19;
    data['q20'] = q20;
    data['type'] = type;
    return data;
  }
}
