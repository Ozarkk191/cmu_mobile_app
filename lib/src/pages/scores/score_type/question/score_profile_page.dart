import 'dart:convert';
import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/all_user_model.dart';
import 'package:cmu_mobile_app/models/profile_model.dart';
import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class ScoreProfilePage extends StatefulWidget {
  final User user;
  final String role;
  const ScoreProfilePage({
    Key? key,
    required this.user,
    required this.role,
  }) : super(key: key);

  @override
  State<ScoreProfilePage> createState() => _ScoreProfilePageState();
}

class _ScoreProfilePageState extends State<ScoreProfilePage> {
  List<String> sex = ["ไม่ระบุ", "ชาย", "หญิง"];
  List<String> religion = ["ไม่ระบุ", "พุทธ", "คริสต์", "อิสลาม"];
  List<String> education = [
    "ไม่ระบุ",
    "ประถมศึกษาปีที่ 4",
    "ประถมศึกษาปีที่ 5",
    "ประถมศึกษาปีที่ 6",
    "มัธยมศึกษาปีที่ 1",
    "มัธยมศึกษาปีที่ 2",
    "มัธยมศึกษาปีที่ 3",
  ];
  List<String> educationLevel = [
    "ไม่ระบุ",
    "ระดับประถมศึกษา",
    "ระดับมัธยมศึกษาตอนต้น",
    "ระดับมัธยมศึกษาตอนปลาย/ปวช.",
    "ระดับอนุปริญญา/ ปวส.",
    "ระดับปริญญาตรี",
    "ระดับปริญญาโท",
  ];
  List<String> educationLevelMonk = [
    "ไม่ระบุ",
    "ระดับปริญญาตรี",
    "ระดับปริญญาโท",
    "ระดับปริญญาเอก"
  ];
  List<String> gradeCompare = ["ไม่ระบุ", "ดีขึ้น", "เท่าเดิม", "แย่ลง"];
  List<String> peopleWith = [
    "ไม่ระบุ",
    "บิดาและมารดา",
    "ญาติพี่น้อง",
    "เช่าหอพักอยู่กับเพื่อน",
    'วัด',
    'อยู่บ้านคนเดียว'
  ];
  List<String> parentOccupation = [
    "ไม่ระบุ",
    "เกษตรกร",
    "รับจ้าง",
    "ค้าขาย",
    "รับราชการ/รัฐวิสาหกิจ",
    "พนักงานบริษัท",
    "ไม่ได้ประกอบอาชีพ"
  ];
  List<String> familyIncome = [
    "ไม่ระบุ",
    "น้อยกว่า 5,000 บาท",
    "5,000 - 10,000 บาท",
    "10,001 - 15,000 บาท",
    "15,001 - 20,000 บาท",
    "20,001 - 25,000 บาท",
    "25,001 - 30,000 บาท",
    "มากกว่า 30,000 บาท"
  ];
  List<String> familyAlcoholic = ["ไม่ระบุ", "ไม่ดื่ม", "ดื่ม"];
  List<String> familyAlcoholicMember = [
    "",
    "พ่อ",
    "แม่",
    "พ่อและแม่",
    "พี่/น้อง",
    "ปู่/ย่า/ตา/ยาย",
    "ลุง/ป้า/น้า/อา"
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> getData() async {
    String path = "${widget.role}/profile/${widget.user.id}";
    var res = await ScoreApi.getScore(path: path);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(
          children: [
            CustomAppbar(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'Profile',
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final parsed = jsonDecode(jsonEncode(snapshot.data));
                  if (parsed["profile"] == null) {
                    return const Center(
                      child: Text("ไม่พบข้อมูล"),
                    );
                  } else {
                    ProfileModel profile =
                        ProfileModel.fromJson(parsed["profile"]);
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.role == "student"
                            ? studentRole(context, profile)
                            : widget.role == "parent"
                                ? parentRole(context, profile)
                                : widget.role == "teacher"
                                    ? teacherRole(context, profile)
                                    : widget.role == "monk"
                                        ? monkRole(context, profile)
                                        : studentRole(context, profile),
                      ),
                    );
                  }
                } else {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox name(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          "${widget.user.name}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget gradeWidget(ProfileModel profile) {
    return textProfile(
      text: "เกรดเฉลี่ยในเทอมที่่ผ่านมา ",
      highligthText: "${profile.grade}",
    );
  }

  Widget gradeCompareWidget(ProfileModel profile) {
    return profile.gradeCompare == 5
        ? textProfile(
            text:
                "ผลการเรียนปัจจุบันของท่านเมื่อเปรียบเทียบกับผลการเรียนในเทอมที่ผ่านมา ",
            highligthText: profile.gradeCompareComment!,
          )
        : textProfile(
            text:
                "ผลการเรียนปัจจุบันของท่านเมื่อเปรียบเทียบกับผลการเรียนในเทอมที่ผ่านมา ",
            highligthText: gradeCompare[profile.gradeCompare!],
          );
  }

  Widget peopleWithWidget(ProfileModel profile) {
    return profile.peopleWith == 6
        ? textProfile(
            text: "บุคคลที่อาศัยอยู่ด้วยในระหว่างที่เรียน คือ ",
            highligthText: profile.peopleWithComment!,
          )
        : textProfile(
            text: "บุคคลที่อาศัยอยู่ด้วยในระหว่างที่เรียน คือ ",
            highligthText: gradeCompare[profile.peopleWith!],
          );
  }

  Widget incomeWidget(ProfileModel profile) {
    return textProfile(
      text: "รายได้ของครอบครัวต่อเดือน ",
      highligthText: familyIncome[profile.familyIncome!],
    );
  }

  Row ageSexReligion(ProfileModel profile) {
    return Row(
      children: [
        Expanded(
          child: textProfile(
            text: "เพศ ",
            highligthText: sex[profile.sex!],
          ),
        ),
        Expanded(
          child: age(profile),
        ),
        Expanded(
          child: profile.religion == 4
              ? textProfile(
                  text: "ศาสนา ",
                  highligthText: profile.religionComment!,
                )
              : textProfile(
                  text: "ศาสนา ",
                  highligthText: religion[profile.religion!],
                ),
        ),
      ],
    );
  }

  Widget age(ProfileModel profile) {
    return textProfile(
      text: "อายุ ",
      highligthText: "${profile.age}",
    );
  }

  Widget educationLevelWidget(ProfileModel profile) {
    return profile.education == 7
        ? textProfile(
            text: "ระดับการศึกษาของท่านคือ",
            highligthText: profile.educationComment!,
          )
        : textProfile(
            text: "ระดับการศึกษาของท่านคือ",
            highligthText: educationLevel[profile.education!],
          );
  }

  Widget educationLevelMonkWidget(ProfileModel profile) {
    return profile.education == 4
        ? textProfile(
            text: "ระดับการศึกษาของท่านคือ ",
            highligthText: profile.educationComment!,
          )
        : textProfile(
            text: "ระดับการศึกษาของท่านคือ",
            highligthText: educationLevelMonk[profile.education!],
          );
  }

  Widget educationWidget(ProfileModel profile) {
    return profile.education == 7
        ? textProfile(
            text: "กำลังศึกษาอยู่ในระดับชั้น",
            highligthText: profile.educationComment!,
          )
        : textProfile(
            text: "กำลังศึกษาอยู่ในระดับชั้น",
            highligthText: educationLevel[profile.education!],
          );
  }

  Widget familyNumbersWidget(ProfileModel profile) {
    return textProfile(
      text: "จำนวนสมาชิกในครอบครัว ",
      highligthText: "${profile.familyNumbers!}",
      postText: " คน",
    );
  }

  Widget parentOccupationWidget(ProfileModel profile) {
    return profile.parentOccupation == 7
        ? textProfile(
            text: "ผู้ปกครองของท่านประกอบอาชีพ ",
            highligthText: profile.parentOccupationComment!,
          )
        : textProfile(
            text: "ผู้ปกครองของท่านประกอบอาชีพ ",
            highligthText: parentOccupation[profile.parentOccupation!],
          );
  }

  Widget moneyPerMonthWidget(ProfileModel profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textProfile(
          text: "รายได้ที่ได้รับ ",
          highligthText: "${profile.moneyPerMonth!}",
          postText: " บาท/เดือน",
        ),
        textProfile(
          text: "รายได้ที่ได้รับ ",
          highligthText: "${profile.moneyPerWeek!}",
          postText: " บาท/สัปดาห์",
        ),
        textProfile(
          text: "รายได้ที่ได้รับ ",
          highligthText: "${profile.moneyPerDay!}",
          postText: " บาท/วัน",
        ),
      ],
    );
  }

  Widget familyAlcoholicWidget(ProfileModel profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textProfile(
          text: "สมาชิกในครอบครัวของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่ ",
          highligthText: familyAlcoholic[profile.familyAlcoholic!],
        ),
        profile.familyAlcoholic != 2
            ? Container()
            : Wrap(
                children: [
                  textProfile(
                    highligthText:
                        familyAlcoholicMember[profile.familyAlcoholicMember1!],
                  ),
                  const SizedBox(width: 10),
                  textProfile(
                    highligthText:
                        familyAlcoholicMember[profile.familyAlcoholicMember2!],
                  ),
                  const SizedBox(width: 10),
                  textProfile(
                    highligthText:
                        familyAlcoholicMember[profile.familyAlcoholicMember3!],
                  ),
                  const SizedBox(width: 10),
                  textProfile(
                    highligthText:
                        familyAlcoholicMember[profile.familyAlcoholicMember4!],
                  ),
                  const SizedBox(width: 10),
                  textProfile(
                    highligthText:
                        familyAlcoholicMember[profile.familyAlcoholicMember5!],
                  ),
                  const SizedBox(width: 10),
                  textProfile(
                    highligthText:
                        familyAlcoholicMember[profile.familyAlcoholicMember6!],
                  ),
                ],
              ),
      ],
    );
  }

  Widget friendAlcoholicWidget(ProfileModel profile) {
    return profile.peopleWith == 3
        ? textProfile(
            text: "เพื่อนของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่ ดื่ม ",
            highligthText: profile.friendAlcoholicComment!,
          )
        : textProfile(
            text: "เพื่อนของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่ ",
            highligthText: familyAlcoholic[profile.friendAlcoholic!],
          );
  }

  Widget textProfile({
    String text = "",
    String postText = "",
    String highligthText = "",
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text.rich(
        TextSpan(
          text: "",
          children: <TextSpan>[
            TextSpan(
              text: text,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            TextSpan(
              text: highligthText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: postText,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> monkRole(BuildContext context, ProfileModel profile) {
    return <Widget>[
      name(context),
      age(profile),
      educationLevelMonkWidget(profile),
      textProfile(
        text: "ท่านบวชมาแล้ว ",
        highligthText: "${profile.yearNumber}",
        postText: " ปี",
      ),
    ];
  }

  List<Widget> teacherRole(BuildContext context, ProfileModel profile) {
    return <Widget>[
      name(context),
      ageSexReligion(profile),
      educationLevelMonkWidget(profile),
      incomeWidget(profile),
    ];
  }

  List<Widget> parentRole(BuildContext context, ProfileModel profile) {
    return <Widget>[
      name(context),
      ageSexReligion(profile),
      educationLevelWidget(profile),
      incomeWidget(profile),
    ];
  }

  List<Widget> studentRole(BuildContext context, ProfileModel profile) {
    return <Widget>[
      name(context),
      ageSexReligion(profile),
      educationWidget(profile),
      gradeWidget(profile),
      gradeCompareWidget(profile),
      peopleWithWidget(profile),
      familyNumbersWidget(profile),
      parentOccupationWidget(profile),
      moneyPerMonthWidget(profile),
      incomeWidget(profile),
      familyAlcoholicWidget(profile),
      friendAlcoholicWidget(profile),
    ];
  }
}
