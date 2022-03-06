import 'body_parameters.dart';

class ProfileModel extends RequestBodyParameters {
  int? userId;
  int? sex;
  int? age;
  int? religion;
  String? religionComment;
  int? education;
  String? educationComment;
  double? grade;
  int? gradeCompare;
  String? gradeCompareComment;
  int? peopleWith;
  String? peopleWithComment;
  int? familyNumbers;
  double? moneyPerMonth;
  double? moneyPerWeek;
  double? moneyPerDay;
  int? parentOccupation;
  String? parentOccupationComment;
  int? familyIncome;
  int? familyAlcoholic;
  int? familyAlcoholicMember1;
  int? familyAlcoholicMember2;
  int? familyAlcoholicMember3;
  int? familyAlcoholicMember4;
  int? familyAlcoholicMember5;
  int? familyAlcoholicMember6;
  int? friendAlcoholic;
  String? friendAlcoholicComment;
  double? yearNumber;

  ProfileModel({
    this.userId = 1,
    this.sex = 0,
    this.age = 0,
    this.religion = 0,
    this.religionComment = "",
    this.education = 0,
    this.educationComment = "",
    this.grade = 0.0,
    this.gradeCompare = 0,
    this.gradeCompareComment = "",
    this.peopleWith = 0,
    this.peopleWithComment,
    this.familyNumbers = 0,
    this.moneyPerMonth = 0.0,
    this.moneyPerWeek = 0.0,
    this.moneyPerDay = 0.0,
    this.parentOccupation = 0,
    this.parentOccupationComment = "",
    this.familyIncome = 0,
    this.familyAlcoholic = 0,
    this.familyAlcoholicMember1 = 0,
    this.familyAlcoholicMember2 = 0,
    this.familyAlcoholicMember3 = 0,
    this.familyAlcoholicMember4 = 0,
    this.familyAlcoholicMember5 = 0,
    this.familyAlcoholicMember6 = 0,
    this.friendAlcoholic = 0,
    this.friendAlcoholicComment = "",
    this.yearNumber = 0.00,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    sex = json['sex'];
    age = json['age'];
    religion = json['religion'];
    religionComment = json['religion_comment'];
    education = json['education'];
    educationComment = json['education_comment'];
    grade = double.parse(json['grade']);
    gradeCompare = json['grade_compare'];
    gradeCompareComment = json['grade_compare_comment'];
    peopleWith = json['people_with'];
    peopleWithComment = json['people_with_comment'];
    familyNumbers = json['family_numbers'];
    moneyPerMonth = double.parse(json['money_per_month']);
    moneyPerWeek = double.parse(json['money_per_week']);
    moneyPerDay = double.parse(json['money_per_day']);
    parentOccupation = json['parent_occupation'];
    parentOccupationComment = json['parent_occupation_comment'];
    familyIncome = json['family_income'];
    familyAlcoholic = json['family_alcoholic'];
    familyAlcoholicMember1 = json['family_alcoholic_member_1'];
    familyAlcoholicMember2 = json['family_alcoholic_member_2'];
    familyAlcoholicMember3 = json['family_alcoholic_member_3'];
    familyAlcoholicMember4 = json['family_alcoholic_member_4'];
    familyAlcoholicMember5 = json['family_alcoholic_member_5'];
    familyAlcoholicMember6 = json['family_alcoholic_member_6'];
    friendAlcoholic = json['friend_alcoholic'];
    friendAlcoholicComment = json['friend_alcoholic_comment'];
    yearNumber = double.parse(json['year_number']);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['sex'] = sex;
    data['age'] = age;
    data['religion'] = religion;
    data['religion_comment'] = religionComment;
    data['education'] = education;
    data['education_comment'] = educationComment;
    data['grade'] = grade;
    data['grade_compare'] = gradeCompare;
    data['grade_compare_comment'] = gradeCompareComment;
    data['people_with'] = peopleWith;
    data['people_with_comment'] = peopleWithComment;
    data['family_numbers'] = familyNumbers;
    data['money_per_month'] = moneyPerMonth;
    data['money_per_week'] = moneyPerWeek;
    data['money_per_day'] = moneyPerDay;
    data['parent_occupation'] = parentOccupation;
    data['parent_occupation_comment'] = parentOccupationComment;
    data['family_income'] = familyIncome;
    data['family_alcoholic'] = familyAlcoholic;
    data['family_alcoholic_member_1'] = familyAlcoholicMember1;
    data['family_alcoholic_member_2'] = familyAlcoholicMember2;
    data['family_alcoholic_member_3'] = familyAlcoholicMember3;
    data['family_alcoholic_member_4'] = familyAlcoholicMember4;
    data['family_alcoholic_member_5'] = familyAlcoholicMember5;
    data['family_alcoholic_member_6'] = familyAlcoholicMember6;
    data['friend_alcoholic'] = friendAlcoholic;
    data['friend_alcoholic_comment'] = friendAlcoholicComment;
    data['year_number'] = yearNumber;
    return data;
  }
}
