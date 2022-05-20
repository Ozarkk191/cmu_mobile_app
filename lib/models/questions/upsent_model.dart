class UpSentModel {
  String? name;
  List<dynamic>? nameList;

  UpSentModel({
    this.name,
    this.nameList,
  });

  UpSentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameList = json['nameList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['nameList'] = nameList;
    return data;
  }
}
