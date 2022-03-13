import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/questions/post_test_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_radio_button.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
import 'package:cmu_mobile_app/utils/quiz_list.dart';
import 'package:flutter/material.dart';

class Quest3 extends StatefulWidget {
  final String prePost;
  final PageController controller;
  final int nextPage;
  final int endPage;
  final int fail;
  const Quest3({
    Key? key,
    required this.prePost,
    required this.controller,
    required this.nextPage,
    this.endPage = 1000,
    required this.fail,
  }) : super(key: key);

  @override
  State<Quest3> createState() => _Quest3State();
}

class _Quest3State extends State<Quest3> {
  List<String> anwserList = [];
  List<int> score = [0, 0, 0, 0, 0, 0];
  late PostTestModel test = PostTestModel();
  bool loading = true;

  late Map<String, dynamic> user = <String, dynamic>{};
  Future<void> checkDoThis() async {
    final data = await SharedPref.getStringPref(key: "user");
    user = jsonDecode(data) as Map<String, dynamic>;
    String path = "student/posttest3/${user["id"]}";
    var res = await ScoreApi.getScore(path: path);
    if (res["profile"] != null) {
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

  void addList() {
    for (var i = 0; i < teenQuizList.length; i++) {
      anwserList.add("");
    }
    setState(() {});
  }

  Future<dynamic> _popUp({required int score}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ), //this right here
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
                children: [
                  Icon(
                    score < 4 ? Icons.not_interested : Icons.check,
                    size: 50,
                    color: const Color(0xffFF6600),
                  ),
                  Text(
                    'คะแนนของคุณคือ $score คะแนน',
                    style: const TextStyle(
                      color: Color(0xffFF6600),
                      fontSize: 16,
                    ),
                  ),
                  score < 4
                      ? const Text(
                          'คุณสอบตก',
                          style: TextStyle(
                            color: Color(0xffFF6600),
                            fontSize: 24,
                          ),
                        )
                      : const Text(
                          'คุณสอบผ่าน',
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
  }

  void _showDialog(int score) {
    setState(() {
      loading = false;
    });
    _popUp(score: score);

    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
    Timer(const Duration(milliseconds: 3500), () {
      if (score >= 4) {
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
      } else {
        widget.controller.jumpToPage(widget.nextPage - widget.fail);
      }
    });
  }

  void onSave() async {
    setState(() {
      loading = false;
    });
    if (widget.prePost == "Post Test") {
      final data = await SharedPref.getStringPref(key: "user");
      Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
      test.userId = user["id"];

      test.q1 = score[0];
      test.q2 = score[1];
      test.q3 = score[2];
      test.q4 = score[3];
      test.q5 = score[4];
      test.q6 = score[5];

      test.total = test.q1 + test.q2 + test.q3 + test.q4 + test.q5 + test.q6;
      log(test.toJson().toString());
      log(score.toString());

      await QuestionApi.setQuestion(
        path: "student3",
        param: test,
      ).then((value) {
        log("question =>${value['message']}");
        if (value['message'] == "success") {
          _showDialog(test.total!);
        }
      });
    } else {
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
    }
  }

  @override
  void initState() {
    checkDoThis();
    addList();
    super.initState();
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
            height: _size.height,
            color: const Color(0xfffbd4b9),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    widget.prePost,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "ความรู้เกี่ยวกับกฏหมายควบคุมเครื่องดื่มแอลกอฮอล์",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: teenQuizList.length,
                        itemBuilder: (context, index) {
                          if (index == 5) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '',
                                    style: DefaultTextStyle.of(context).style,
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text:
                                            '6. ข้อใดเป็นสาเหตุของการดื่มเครื่องดื่มแอลกอฮอล์ของวัยรุ่น ',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'น้อยที่สุด',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                quiz(
                                  choice: teenQuizList[index].choice!,
                                  answer: anwserList[index],
                                  onChanged: (val) {
                                    setState(() {
                                      anwserList[index] = val!;
                                      score.removeAt(index);
                                      if (val ==
                                          teenQuizList[index].choice![
                                              teenQuizList[index].aswer!]) {
                                        score.insert(index, 1);
                                      } else {
                                        score.insert(index, 0);
                                      }
                                    });
                                  },
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  teenQuizList[index].quiz!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                quiz(
                                  choice: teenQuizList[index].choice!,
                                  answer: anwserList[index],
                                  onChanged: (val) {
                                    setState(() {
                                      anwserList[index] = val!;
                                      score.removeAt(index);
                                      if (val ==
                                          teenQuizList[index].choice![
                                              teenQuizList[index].aswer!]) {
                                        score.insert(index, 1);
                                      } else {
                                        score.insert(index, 0);
                                      }
                                    });
                                  },
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    width: _size.width * 0.5,
                    ontab: onSave,
                    borderRadius: 50,
                    title: widget.nextPage == widget.endPage
                        ? "ส่งคำตอบ"
                        : 'ส่งคำตอบ',
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column quiz({
    required List<String> choice,
    required String answer,
    required Function(String? val) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: choice.length,
          itemBuilder: (context, index) {
            return MainRadioButton(
              title: choice[index],
              groupValue: answer,
              onChanged: onChanged,
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
