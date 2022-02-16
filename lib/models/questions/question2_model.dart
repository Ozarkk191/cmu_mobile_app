import '../body_parameters.dart';

class Question2Model extends RequestBodyParameters {
  int? userId;
  int? q1;
  String? q1Comment;
  int? q2;
  String? q2Comment;
  int? q3;
  String? q3Comment;
  int? q4;
  String? q4Comment;
  int? q5;
  String? q5Comment;

  Question2Model({
    this.userId = 0,
    this.q1 = 0,
    this.q1Comment = "",
    this.q2 = 0,
    this.q2Comment = "",
    this.q3 = 0,
    this.q3Comment = "",
    this.q4 = 0,
    this.q4Comment = "",
    this.q5 = 0,
    this.q5Comment = "",
  });

  Question2Model.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    q1 = json['q1'];
    q1Comment = json['q1_comment'];
    q2 = json['q2'];
    q2Comment = json['q2_comment'];
    q3 = json['q3'];
    q3Comment = json['q3_comment'];
    q4 = json['q4'];
    q4Comment = json['q4_comment'];
    q5 = json['q5'];
    q5Comment = json['q5_comment'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['q1'] = q1;
    data['q1_comment'] = q1Comment;
    data['q2'] = q2;
    data['q2_comment'] = q2Comment;
    data['q3'] = q3;
    data['q3_comment'] = q3Comment;
    data['q4'] = q4;
    data['q4_comment'] = q4Comment;
    data['q5'] = q5;
    data['q5_comment'] = q5Comment;
    return data;
  }
}
