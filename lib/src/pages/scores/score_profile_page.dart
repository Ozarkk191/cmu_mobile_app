import 'dart:developer';

import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/profile_model.dart';
import 'package:flutter/material.dart';

import '../../../models/all_user_model.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/layouts/main_layout.dart';

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
  ProfileModel profile = ProfileModel();
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
    getData();
    super.initState();
  }

  void getData() async {
    String path = "${widget.role}/profile/${widget.user.id}";
    log("path::$path");
    var res = await ScoreApi.getScore(path: path);
    profile = ProfileModel.fromJson(res);
    log(res.toString());
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "${widget.user.name}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: textProfile(
                          text: "เพศ ",
                          highligthText: sex[profile.sex!],
                        ),
                      ),
                      Expanded(
                        child: textProfile(
                          text: "อายุ ",
                          highligthText: "${profile.age}",
                        ),
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
                  ),
                  profile.education == 7
                      ? textProfile(
                          text: "กำลังศึกษาอยู่ในระดับชั้น ",
                          highligthText: profile.educationComment!,
                        )
                      : textProfile(
                          text: "กำลังศึกษาอยู่ในระดับชั้น ",
                          highligthText: education[profile.education!],
                        ),
                  textProfile(
                    text: "เกรดเฉลี่ยในเทอมที่่ผ่านมา ",
                    highligthText: "${profile.grade}",
                  ),
                  profile.gradeCompare == 5
                      ? textProfile(
                          text:
                              "ผลการเรียนปัจจุบันของท่านเมื่อเปรียบเทียบกับผลการเรียนในเทอมที่ผ่านมา ",
                          highligthText: profile.gradeCompareComment!,
                        )
                      : textProfile(
                          text:
                              "ผลการเรียนปัจจุบันของท่านเมื่อเปรียบเทียบกับผลการเรียนในเทอมที่ผ่านมา ",
                          highligthText: gradeCompare[profile.gradeCompare!],
                        ),
                  profile.peopleWith == 6
                      ? textProfile(
                          text: "บุคคลที่อาศัยอยู่ด้วยในระหว่างที่เรียน คือ ",
                          highligthText: profile.peopleWithComment!,
                        )
                      : textProfile(
                          text: "บุคคลที่อาศัยอยู่ด้วยในระหว่างที่เรียน คือ ",
                          highligthText: gradeCompare[profile.peopleWith!],
                        ),
                  textProfile(
                    text: "จำนวนสมาชิกในครอบครัว ",
                    highligthText: "${profile.familyNumbers!}",
                    postText: " คน",
                  ),
                  profile.parentOccupation == 7
                      ? textProfile(
                          text: "ผู้ปกครองของท่านประกอบอาชีพ ",
                          highligthText: profile.parentOccupationComment!,
                        )
                      : textProfile(
                          text: "ผู้ปกครองของท่านประกอบอาชีพ ",
                          highligthText:
                              parentOccupation[profile.parentOccupation!],
                        ),
                  Column(
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
                  ),
                  textProfile(
                    text: "รายได้ของครอบครัวต่อเดือน ",
                    highligthText: familyIncome[profile.familyIncome!],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textProfile(
                        text:
                            "สมาชิกในครอบครัวของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่ ",
                        highligthText:
                            familyAlcoholic[profile.familyAlcoholic!],
                      ),
                      profile.familyAlcoholic != 2
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textProfile(
                                  highligthText: familyAlcoholicMember[
                                      profile.familyAlcoholicMember1!],
                                ),
                                textProfile(
                                  highligthText: familyAlcoholicMember[
                                      profile.familyAlcoholicMember2!],
                                ),
                                textProfile(
                                  highligthText: familyAlcoholicMember[
                                      profile.familyAlcoholicMember3!],
                                ),
                                textProfile(
                                  highligthText: familyAlcoholicMember[
                                      profile.familyAlcoholicMember4!],
                                ),
                                textProfile(
                                  highligthText: familyAlcoholicMember[
                                      profile.familyAlcoholicMember5!],
                                ),
                                textProfile(
                                  highligthText: familyAlcoholicMember[
                                      profile.familyAlcoholicMember6!],
                                ),
                              ],
                            ),
                    ],
                  ),
                  profile.peopleWith == 3
                      ? textProfile(
                          text:
                              "เพื่อนของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่ ดื่ม ",
                          highligthText: profile.friendAlcoholicComment!,
                        )
                      : textProfile(
                          text: "เพื่อนของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่ ",
                          highligthText:
                              familyAlcoholic[profile.friendAlcoholic!],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
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
}
