import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/questions/question2_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_radio_button.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
import 'package:flutter/material.dart';

class QuestionAlcoholBehaviorPage extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  final int endPage;
  final int number;
  final String type;
  const QuestionAlcoholBehaviorPage({
    Key? key,
    required this.controller,
    required this.nextPage,
    this.endPage = 1000,
    this.type = "post",
    required this.number,
  }) : super(key: key);

  @override
  _QuestionAlcoholBehaviorPageState createState() =>
      _QuestionAlcoholBehaviorPageState();
}

class _QuestionAlcoholBehaviorPageState
    extends State<QuestionAlcoholBehaviorPage> {
  late Question2Model question2 = Question2Model();
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller3 = TextEditingController();
  late TextEditingController controller4 = TextEditingController();
  late TextEditingController controller5 = TextEditingController();
  String anwser1 = "";
  String anwser2 = "";
  String anwser3 = "";
  String anwser4 = "";
  String anwser5 = "";
  bool loading = true;
  bool checkFirst = false;

  late Map<String, dynamic> user = <String, dynamic>{};
  Future<void> checkDoThis() async {
    final data = await SharedPref.getStringPref(key: "user");
    user = jsonDecode(data) as Map<String, dynamic>;
    String path = "";
    if (widget.type == "pre") {
      path = "${user["role"]}/question2/${user["id"]}";
    } else {
      path = "${user["role"]}/question2/${user["id"]}/post";
    }
    var res = await ScoreApi.getScore(path: path);
    log(res.toString());
    if (res["question2"] != null) {
      if (widget.endPage == widget.nextPage) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(initPage: 0),
          ),
        );
      } else {
        widget.controller.jumpToPage(widget.nextPage);
      }
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  void onSave() async {
    setState(() {
      loading = true;
    });
    final data = await SharedPref.getStringPref(key: "user");
    Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
    question2.userId = user["id"];
    question2.q1Comment = controller1.text;
    question2.q3Comment = controller3.text;
    question2.q4Comment = controller4.text;
    question2.q5Comment = controller5.text;
    question2.type = widget.type;

    String path = "";
    switch (user["role"]) {
      case "student":
        path = "question2";
        break;
      case "parent":
        path = "parent/question2";
        break;
      case "teacher":
        path = "teacher/question2";
        break;
      default:
    }
    log(question2.toJson().toString());
    log("path ==>$path");

    await QuestionApi.setQuestion(path: path, param: question2).then((value) {
      if (value['message'] == "success") {
        setState(() {
          loading = false;
        });
        if (checkFirst) {
          int nextPage = widget.nextPage + 1;

          if (nextPage == widget.endPage) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(initPage: 0),
              ),
            );
          } else {
            widget.controller.jumpToPage(nextPage);
          }
        } else {
          successDialog();
        }
      }
    });
  }

  void successDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                width: 1,
                color: const Color(0xffFF6600),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.check,
                    size: 50,
                    color: Color(0xffFF6600),
                  ),
                  Text(
                    "ส่งคำตอบเรียบร้อยแล้ว",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffFF6600),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    Timer(const Duration(seconds: 3), () {
      if (widget.nextPage == widget.endPage) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(initPage: 0),
          ),
        );
      } else {
        widget.controller.jumpToPage(widget.nextPage);
      }
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    checkDoThis();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: LoadingBox(
          loading: loading,
          child: Container(
            width: _size.width,
            color: const Color(0xfffbd4b9),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    width: _size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ส่วนที่ ${widget.number} พฤติกรรมการดื่มเครื่องดื่มแอลกอฮอล์',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: _size.width * 0.6,
                            child: Image.asset('assets/icons/exam.png'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _quiz1(),
                        _quiz2(),
                        _quiz3(),
                        _quiz4(),
                        _quiz5(),
                        const SizedBox(height: 40),
                        Center(
                          child: MainButton(
                            ontab: onSave,
                            width: _size.width * 0.5,
                            borderRadius: 50,
                            title: 'ถัดไป',
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _quiz5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '5. ชนิดของเครื่องดื่มเครื่องดื่มแอลกอฮอล์ที่ท่านดื่ม',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'เหล้า',
          groupValue: anwser5,
          onChanged: (String? value) {
            setState(() {
              anwser5 = value!;
              question2.q5 = 1;
            });
          },
        ),
        _radioButton(
          title: 'เบียร์',
          groupValue: anwser5,
          onChanged: (String? value) {
            setState(() {
              anwser5 = value!;
              question2.q5 = 2;
            });
          },
        ),
        _radioButton(
          title: 'ไวน์ (สไปร์)',
          groupValue: anwser5,
          onChanged: (String? value) {
            setState(() {
              anwser5 = value!;
              question2.q5 = 3;
            });
          },
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          groupValue: anwser5,
          textField: true,
          controller: controller5,
          onChanged: (String? value) {
            setState(() {
              anwser5 = value!;
              question2.q5 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _quiz4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '4. บุคคลที่ท่านดื่มเครื่องดื่มแอลกอฮอล์ด้วย',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'เพื่อน',
          groupValue: anwser4,
          onChanged: (String? value) {
            setState(() {
              anwser4 = value!;
              question2.q4 = 1;
            });
          },
        ),
        _radioButton(
          title: 'สมาชิกในครอบครัว',
          groupValue: anwser4,
          onChanged: (String? value) {
            setState(() {
              anwser4 = value!;
              question2.q4 = 2;
            });
          },
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          groupValue: anwser4,
          textField: true,
          controller: controller4,
          onChanged: (String? value) {
            setState(() {
              anwser4 = value!;
              question2.q4 = 3;
              // anwser4 = "$value ${controller4.text}";
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _quiz3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3. ในการดื่มแต่ละครั้ง ท่านดื่มปริมาณกี่หน่วยดื่มมาตราฐาน',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'น้อยกว่า 1 ดื่มมาตราฐาน',
          groupValue: anwser3,
          onChanged: (String? value) {
            setState(() {
              anwser3 = value!;
              question2.q3 = 1;
            });
          },
        ),
        _radioButton(
          title: '1-4 ดื่มมาตราฐาน',
          groupValue: anwser3,
          onChanged: (String? value) {
            setState(() {
              anwser3 = value!;
              question2.q3 = 2;
            });
          },
        ),
        _radioButton(
          title: '5 ดื่มมาตราฐานขึ้นไป',
          groupValue: anwser3,
          onChanged: (String? value) {
            setState(() {
              anwser3 = value!;
              question2.q3 = 3;
            });
          },
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          groupValue: anwser3,
          textField: true,
          controller: controller3,
          onChanged: (String? value) {
            setState(() {
              anwser3 = value!;
              question2.q3 = 4;
              // anwser4 = "$value ${controller4.text}";
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _quiz2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '2. ท่านดื่มเครื่องดื่มแอลกอฮอล์ครั้งล่าสุดเมื่อไหร่',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: '1 ปีที่ผ่านมา',
          groupValue: anwser2,
          onChanged: (String? value) {
            setState(() {
              anwser2 = value!;
              question2.q2 = 1;
            });
          },
        ),
        _radioButton(
          title: '1 เดือนที่ผ่านมา',
          groupValue: anwser2,
          onChanged: (String? value) {
            setState(() {
              anwser2 = value!;
              question2.q2 = 2;
            });
          },
        ),
        _radioButton(
          title: '1 สัปดาห์ที่ผ่านมา',
          groupValue: anwser2,
          onChanged: (String? value) {
            setState(() {
              anwser2 = value!;
              question2.q2 = 3;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _quiz1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1. ตลอดชีวิตที่ผ่านมา ท่านเคยดื่มเครื่องดื่มแอลกอฮอล์หรือไหม (ไม่นับรวมจิบ/ชิมเพียงเล็กน้อย)',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'ไม่เคยดื่มเลย (ไม่ต้องทำข้อต่อไปข้ามข้อ 3)',
          groupValue: anwser1,
          onChanged: (String? value) {
            setState(() {
              checkFirst = true;
              anwser1 = value!;
              anwser2 = "";
              anwser3 = "";
              anwser4 = "";
              anwser5 = "";
              question2.q1 = 1;
              question2.q2 = 0;
              question2.q3 = 0;
              question2.q4 = 0;
              question2.q5 = 0;
              question2.q1Comment = "";
              question2.q2Comment = "";
              question2.q3Comment = "";
              question2.q4Comment = "";
              question2.q5Comment = "";
            });
          },
        ),
        MainRadioButton(
          title: 'เคยดื่ม ดื่มครั้งแรกตอนอายุ',
          groupValue: anwser1,
          textField: true,
          controller: controller1,
          suffix: 'ปี',
          enabled: !checkFirst,
          onChanged: (String? value) {
            setState(() {
              checkFirst = false;
              anwser1 = value!;
              question2.q1 = 2;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _radioButton({
    required String title,
    String suffix = "",
    required Function(String?) onChanged,
    required String groupValue,
    TextEditingController? controller,
    bool textField = false,
  }) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Radio(
            value: title,
            groupValue: groupValue,
            onChanged: checkFirst ? null : onChanged,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 10),
          ),
          Visibility(
            visible: textField,
            child: SizedBox(
              width: 80,
              height: 40,
              child: TextField(
                enabled: !checkFirst,
                controller: controller,
                style: const TextStyle(fontSize: 10),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 17),
                ),
              ),
            ),
          ),
          Text(
            suffix,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
