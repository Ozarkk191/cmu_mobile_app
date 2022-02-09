class QuizModel {
  String? quiz;
  List<String>? choice;
  int? aswer;
  int? selecteChoice;
  List<String>? selecteAswer;

  QuizModel({
    this.quiz,
    this.choice,
    this.aswer,
    this.selecteChoice,
    this.selecteAswer,
  });

  QuizModel.fromJson(Map<String, dynamic> json) {
    quiz = json['quiz'];
    choice = json['choice'].cast<String>();
    aswer = json['aswer'];
    selecteChoice = json['selecte_choice'];
    selecteAswer = json['selecte_aswer'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quiz'] = quiz;
    data['choice'] = choice;
    data['aswer'] = aswer;
    data['selecte_choice'] = selecteChoice;
    data['selecte_aswer'] = selecteAswer;
    return data;
  }
}
