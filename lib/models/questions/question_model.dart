import '../body_parameters.dart';

class QuestionModel extends RequestBodyParameters {
  int? userId;
  List<int>? answer;

  QuestionModel({this.userId, this.answer});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    answer = json['answer'].cast<int>();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['answer'] = answer;
    return data;
  }
}
