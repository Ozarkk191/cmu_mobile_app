import 'dart:developer';

import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/questions/question2_model.dart';
import 'package:flutter/material.dart';

import '../../../models/body_parameters.dart';
import '../../../models/questions/question14_model.dart';
import '../../../models/questions/question20_model.dart';
import '../../../models/questions/question3_model.dart';
import '../../../models/questions/question4_model.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/layouts/main_layout.dart';

class ScorePage extends StatefulWidget {
  final String id;
  final String role;
  final String nameQuestion;
  final String title;
  const ScorePage({
    Key? key,
    required this.id,
    required this.role,
    required this.nameQuestion,
    required this.title,
  }) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  Widget page = Container();
  @override
  void initState() {
    getTypeQuestion();
    super.initState();
  }

  void getTypeQuestion() async {
    Map<String, dynamic> data = await getData();
    switch (widget.nameQuestion) {
      case "question2":
        Question2Model question = Question2Model.fromJson(data["question2"]);
        page = question2Page(question);
        break;
      case "question3":
        Question3Model question = Question3Model.fromJson(data["question3"]);
        break;
      case "question4":
        Question4Model question = Question4Model.fromJson(data["question4"]);
        break;
      case "question5":
        QuestionModel20 question = QuestionModel20.fromJson(data["question5"]);
        break;
      case "question6":
        QuestionModel14 question = QuestionModel14.fromJson(data["question6"]);
        break;
      case "question7":
        QuestionModel20 question = QuestionModel20.fromJson(data["question7"]);
        break;
      case "question8":
        QuestionModel14 question = QuestionModel14.fromJson(data["question8"]);
        break;
      default:
        Question2Model question = Question2Model.fromJson(data["question2"]);
        page = question2Page(question);
        break;
    }
    setState(() {});
  }

  Future<Map<String, dynamic>> getData() async {
    String path = "${widget.role}/${widget.nameQuestion}/${widget.id}";
    log("path :: $path");
    var res = await ScoreApi.getScore(path: path);
    log(res.toString());
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(children: [
          CustomAppbar(
            onTap: () {
              Navigator.pop(context);
            },
            title: widget.title,
          ),
          page,
        ]),
      ),
    );
  }

  Widget questionText(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  Text answerText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Widget question2Page(Question2Model question) {
    List<String> quest1 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ ไม่เคยดื่มเลย",
      "คำตอบของท่านคือ เคยดื่ม"
    ];
    List<String> quest2 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ 1 ปีที่ผ่านมา",
      "คำตอบของท่านคือ 1 เดือนที่ผ่านมา",
      "คำตอบของท่านคือ 1 สัปดาห์ที่ผ่านมา"
    ];
    List<String> quest3 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ น้อยกว่า 1 ดื่มมาตราฐาน",
      "คำตอบของท่านคือ 5 ดื่มมาตราฐานขึ้นไป",
      "คำตอบของท่านคือ"
    ];
    List<String> quest4 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ เพื่อน",
      "คำตอบของท่านคือ สมาชิกในครอบครัว",
      "คำตอบของท่านคือ"
    ];
    List<String> quest5 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ เหล้า",
      "คำตอบของท่านคือ เบียร์",
      "คำตอบของท่านคือ ไวน์ (สไปร์)",
      "คำตอบของท่านคือ",
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionText(
              "1. ตลอดชีวิตที่ผ่านมา ท่านเคยดื่มเครื่องดื่มแอลกอฮอล์หรือไหม (ไม่นับรวมจิบ/ชิมเพียงเล็กน้อย)"),
          question.q1 == 2
              ? answerText(
                  "${quest1[question.q1!]} ดื่มครั้งแรกตอนอายุ ${question.q1Comment} ปี")
              : answerText(quest1[question.q1!]),
          questionText("2. ท่านดื่มเครื่องดื่มแอลกอฮอล์ครั้งล่าสุดเมื่อไหร่"),
          answerText(quest2[question.q2!]),
          questionText(
              "3. ในการดื่มแต่ละครั้ง ท่านดื่มปริมาณกี่หน่วยดื่มมาตราฐาน"),
          question.q3 == 2
              ? answerText("${quest3[question.q3!]}  ${question.q3Comment}")
              : answerText(quest3[question.q3!]),
          questionText("4. บุคคลที่ท่านดื่มเครื่องดื่มแอลกอฮอล์ด้วย"),
          question.q4 == 2
              ? answerText("${quest4[question.q4!]}  ${question.q4Comment}")
              : answerText(quest4[question.q4!]),
          questionText("5. ชนิดของเครื่องดื่มเครื่องดื่มแอลกอฮอล์ที่ท่านดื่ม"),
          question.q5 == 3
              ? answerText("${quest5[question.q5!]}  ${question.q5Comment}")
              : answerText(quest5[question.q5!]),
        ],
      ),
    );
  }
}
