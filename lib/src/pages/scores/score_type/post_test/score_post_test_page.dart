import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/questions/post_test_model.dart';
import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/utils/quiz_list.dart';
import 'package:flutter/material.dart';

class ScorePostTestPage extends StatefulWidget {
  final String title;
  final String userID;
  final String subPath;
  const ScorePostTestPage({
    Key? key,
    required this.title,
    required this.userID,
    required this.subPath,
  }) : super(key: key);

  @override
  State<ScorePostTestPage> createState() => _ScorePostTestPageState();
}

class _ScorePostTestPageState extends State<ScorePostTestPage> {
  List<Widget> listWidget = [];

  Future<Map<String, dynamic>?> getData() async {
    String path = "student/${widget.subPath}/${widget.userID}";
    var res = await ScoreApi.getScore(path: path);
    if (res["message"] == "success") {
      return res[widget.subPath];
    }
    return null;
  }

  List<Widget> setWidget(PostTestModel postTest) {
    switch (widget.subPath) {
      case "posttest1":
        return postTestWidget1(postTest);
      case "posttest2":
        return postTestWidget2(postTest);
      case "posttest3":
        return postTestWidget3(postTest);
      default:
        return postTestWidget1(postTest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppbar(
            title: widget.title,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: MainLayout(
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Center(
                    child: Text('ยังไม่มีการตอบคำถาม'),
                  );
                } else {
                  var data = snapshot.data;
                  PostTestModel postTest =
                      PostTestModel.fromJson(jsonDecode(jsonEncode(data)));
                  listWidget = setWidget(postTest);
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: listWidget,
                    ),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> postTestWidget1(PostTestModel postTest) {
    return [
      questionText(alcoholQuizList[0].quiz!),
      postTest.q1 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + alcoholQuizList[0].choice![postTest.q1]),
      questionText(alcoholQuizList[1].quiz!),
      postTest.q2 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + alcoholQuizList[1].choice![postTest.q2]),
      questionText(alcoholQuizList[2].quiz!),
      postTest.q3 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + alcoholQuizList[2].choice![postTest.q3]),
      questionText(alcoholQuizList[3].quiz!),
      postTest.q4 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + alcoholQuizList[3].choice![postTest.q4]),
      questionText(alcoholQuizList[4].quiz!),
      postTest.q5 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + alcoholQuizList[4].choice![postTest.q5]),
      questionText(alcoholQuizList[5].quiz!),
      postTest.q6 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + alcoholQuizList[5].choice![postTest.q6]),
    ];
  }

  List<Widget> postTestWidget2(PostTestModel postTest) {
    return [
      questionText(lowQuizList[0].quiz!),
      postTest.q1 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + lowQuizList[0].choice![postTest.q1]),
      questionText(lowQuizList[1].quiz!),
      postTest.q2 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + lowQuizList[1].choice![postTest.q2]),
      questionText(lowQuizList[2].quiz!),
      postTest.q3 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + lowQuizList[2].choice![postTest.q3]),
      questionText(lowQuizList[3].quiz!),
      postTest.q4 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + lowQuizList[3].choice![postTest.q4]),
      questionText(lowQuizList[4].quiz!),
      postTest.q5 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + lowQuizList[4].choice![postTest.q5]),
      questionText(lowQuizList[5].quiz!),
      postTest.q6 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + lowQuizList[5].choice![postTest.q6]),
    ];
  }

  List<Widget> postTestWidget3(PostTestModel postTest) {
    return [
      questionText(teenQuizList[0].quiz!),
      postTest.q1 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + teenQuizList[0].choice![postTest.q1]),
      questionText(teenQuizList[1].quiz!),
      postTest.q2 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + teenQuizList[1].choice![postTest.q2]),
      questionText(teenQuizList[2].quiz!),
      postTest.q3 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + teenQuizList[2].choice![postTest.q3]),
      questionText(teenQuizList[3].quiz!),
      postTest.q4 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + teenQuizList[3].choice![postTest.q4]),
      questionText(teenQuizList[4].quiz!),
      postTest.q5 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + teenQuizList[4].choice![postTest.q5]),
      questionText(teenQuizList[5].quiz!),
      postTest.q6 == 0
          ? answerText("   ท่านไม่ได้ตอบคำถามนี้")
          : answerText(
              "   คำตอบของท่านคือ " + teenQuizList[5].choice![postTest.q6]),
    ];
  }

  Widget questionText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }

  Container answerText(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
