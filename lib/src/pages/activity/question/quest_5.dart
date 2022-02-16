import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/models/questions/question_model.dart';
import 'package:cmu_mobile_app/models/quiz_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_radio_button.dart';
import 'package:cmu_mobile_app/utils/assessment_list.dart';
import 'package:flutter/material.dart';

class Quest5 extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  final String quizType;
  // final String quizType;
  final int endPage;
  const Quest5({
    Key? key,
    required this.controller,
    required this.nextPage,
    required this.quizType,
    this.endPage = 1000,
  }) : super(key: key);

  @override
  _Quest5State createState() => _Quest5State();
}

class _Quest5State extends State<Quest5> {
  List<String> anwserList = [];
  List<int> anwserIntList = [];
  String subTitle = "";
  String path = "";
  late QuestionModel quest = QuestionModel();

  late List<QuizModel> _list;

  void _checkQuiz() {
    switch (widget.quizType) {
      case "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์":
        _list = alcoholList;
        addList(alcoholList);
        path = "question5";
        subTitle = "ท่านมีความคิดเห็นต่อการดื่มเครื่องดื่มแอลกอฮอล์อย่างไร";
        break;
      case "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์":
        _list = rejectAlcoholList;
        addList(rejectAlcoholList);
        subTitle = "ท่านมั่นใจว่าจะไม่ดื่มสุราในสถานการณ์ดังต่อไปนี้";
        path = "question6";
        break;
      case "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่":
        _list = parentAlcoholList;
        addList(parentAlcoholList);
        path = "question7";
        break;
      case "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์":
        _list = noAlcoholList;
        addList(noAlcoholList);
        path = "question8";
        break;
      case "แบบวัดความมีคุณค่าในตนเอง":
        _list = selfWorthList;
        addList(selfWorthList);
        break;

      default:
    }
  }

  void addList(List<QuizModel> list) {
    for (var i = 0; i < list.length; i++) {
      anwserList.add("");
      anwserIntList.add(0);
    }
    setState(() {});
  }

  Future<int> onChoiceQuest5(String ans) async {
    switch (ans) {
      case "ไม่เห็นด้วยอย่างยิ่ง":
        return 1;
      case "ไม่เห็นด้วย":
        return 2;
      case "เห็นด้วย":
        return 3;
      case "เห็นด้วยอย่างยิ่ง":
        return 4;
      default:
        return 0;
    }
  }

  Future<int> onChoiceQuest6(String ans) async {
    switch (ans) {
      case "มั่นใจอย่างยิ่ง":
        return 1;
      case "ค่อนข้างมั่นใจ":
        return 2;
      case "ค่อนข้างไม่มั่นใจ":
        return 3;
      case "ไม่มั่นใจเลย":
        return 4;
      default:
        return 0;
    }
  }

  Future<int> onChoiceQuest7(String ans) async {
    switch (ans) {
      case "บ่อยที่สุด":
        return 1;
      case "บ่อย":
        return 2;
      case "ปานกลาง":
        return 3;
      case "น้อย":
        return 4;
      case "น้อยที่สุด":
        return 5;
      default:
        return 0;
    }
  }

  Future<int> onChoiceQuest8(String ans) async {
    switch (ans) {
      case "ไม่ดื่มแน่นอน":
        return 1;
      case "ไม่ดื่ม":
        return 2;
      case "ไม่แน่ใจ":
        return 3;
      case "ดื่ม":
        return 4;
      case "ดื่มแน่นอน":
        return 5;
      default:
        return 0;
    }
  }

  Future<int> onChoiceQuest9(String ans) async {
    switch (ans) {
      case "เห็นด้วยอย่างยิ่ง":
        return 1;
      case "เห็นด้วย":
        return 2;
      case "ไม่เห็นด้วย":
        return 3;
      case "ไม่เห็นด้วยอย่างยิ่ง":
        return 4;

      default:
        return 0;
    }
  }

  Future<int> onCheckChoice(String ans) async {
    switch (widget.quizType) {
      case "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์":
        return await onChoiceQuest5(ans);
      case "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์":
        return await onChoiceQuest6(ans);
      case "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่":
        return await onChoiceQuest7(ans);
      case "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์":
        return await onChoiceQuest8(ans);
      case "แบบวัดความมีคุณค่าในตนเอง":
        return await onChoiceQuest9(ans);
      default:
        return 0;
    }
  }

  void onSave() async {
    anwserIntList.clear();
    for (var i = 0; i < anwserList.length; i++) {
      anwserIntList.add(await onCheckChoice(anwserList[i]));
    }
    // final data = await SharedPref.getStringPref(key: "user");
    // Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
    // quest.userId = user["id"];
    // quest.answer = anwserIntList;

    Map<String, dynamic> val = {
      "user_id": 3,
      "answer": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    };
    QuestionModel _quest = QuestionModel.fromJson(val);

    await QuestionApi.setQuestion(
      path: "question5",
      param: _quest,
    ).then((value) {
      log("$path ==> ${value['message']}");
      // if (value['message'] == "success") {
      //   if (widget.nextPage == widget.endPage) {
      //     Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const HomePage(initPage: 0),
      //       ),
      //     );
      //   } else {
      //     widget.controller.jumpToPage(widget.nextPage);
      //   }
      // }
    });
  }

  @override
  void initState() {
    _checkQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _size.width,
          height: _size.height,
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
                        'ส่วนที่ ${widget.nextPage - 1} ${widget.quizType}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      widget.quizType ==
                              "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์"
                          ? _text(context)
                          : widget.quizType ==
                                  "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์"
                              ? _text6(context)
                              : widget.quizType ==
                                      "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่"
                                  ? _text7(context)
                                  : widget.quizType ==
                                          "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์"
                                      ? _text8(context)
                                      : Container(),
                      const SizedBox(height: 20),
                      widget.quizType ==
                              "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์"
                          ? _textSub(context)
                          : Text(
                              subTitle,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return quiz(
                            title: _list[index].quiz!,
                            choice: _list[index].choice!,
                            answer: anwserList[index],
                            onChanged: (val) {
                              setState(() {
                                anwserList[index] = val!;
                              });
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: MainButton(
                          ontab: onSave,
                          width: _size.width * 0.5,
                          borderRadius: 50,
                          title: widget.nextPage == widget.endPage
                              ? "ส่งคำตอบ"
                              : 'ถัดไป',
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
    );
  }

  Column quiz({
    required String title,
    required List<String> choice,
    required String answer,
    required Function(String? val) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
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

  RichText _text(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'คำชี้แจง ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                ' แบบวัดนี้เป็นแบบสอบถามเกี่ยวกับความรู้สึกนึกคิดของท่านที่มีต่อการดื่มเครื่องดื่มแอลกอฮอล์ กรุณาตัดสินใจว่าท่านเห็นด้วยหรือไม่เห็นด้วยมากน้อยแค่ไหนกับข้อความข้างล่างนี้ โดยเลือกคำตอบที่ตรงกับความรู้สึกของท่านตามความเป็นจริงให้มากที่สุด',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  RichText _text6(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'คำชี้แจง ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                ' กรุณาทำเลือกข้อที่ตรงกับความรู้สึกของท่านมากที่สุดเพียงคำตอบเดียว',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  RichText _text7(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'คำชี้แจง ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                ' กรุณาทำเลือกข้อที่ท่านคิดว่าตรงกับความเป็นจริงของตัวท่านมากที่สุด',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  RichText _text8(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'คำชี้แจง ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                ' แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์ เป็นแบบวัดความพร้อมของท่านที่จะหลีกเลี่ยง   การดื่มเครื่องดื่มแอลกอฮอล์ในสถานการณ์ที่ชักนำไปสู่การดื่มเครื่องดื่มแอลกอฮอล์ กรุณาทำเลือกข้อที่ตรงกับระดับความตั้งใจของท่านมากที่สุด',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  RichText _textSub(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'ท่านมั่นใจว่าจะ ',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: 'ไม่ดื่ม',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: ' สุราในสาถานการณ์ดังต่อไปนี้',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
