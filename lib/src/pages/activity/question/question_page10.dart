import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:cmu_mobile_app/models/learning_model.dart';
import 'package:cmu_mobile_app/models/questions/reflex_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
import 'package:flutter/material.dart';

class QuestionPage10 extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  final int? endPage;
  const QuestionPage10({
    Key? key,
    required this.controller,
    required this.nextPage,
    this.endPage,
  }) : super(key: key);
  @override
  State<QuestionPage10> createState() => _QuestionPage10State();
}

class _QuestionPage10State extends State<QuestionPage10> {
  late ReflexModel reflexModel = ReflexModel();
  TextEditingController q1Controller = TextEditingController();
  TextEditingController q2Controller = TextEditingController();
  TextEditingController q3Controller = TextEditingController();

  bool loading = true;

  @override
  void initState() {
    checkDoThis();
    super.initState();
  }

  late Map<String, dynamic> user = <String, dynamic>{};
  Future<void> checkDoThis() async {
    final data = await SharedPref.getStringPref(key: "user");
    user = jsonDecode(data) as Map<String, dynamic>;
    String _path = "${user["role"]}/reflex10/${user["id"]}";
    log(_path);
    var res = await ScoreApi.getScore(path: _path);
    if (res["reflex10"] != null) {
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

  void onSetData() async {
    final data = await SharedPref.getStringPref(key: "user");
    Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
    reflexModel.userId = user["id"];
    reflexModel.q1 = "empty";
    reflexModel.q2 = "empty";
    reflexModel.q3 = "empty";

    reflexModel.q1 = q1Controller.text;
    reflexModel.q2 = q2Controller.text;
    reflexModel.q3 = q2Controller.text;

    log(reflexModel.toJson().toString());

    onSave(quest: reflexModel);
  }

  void onSave({required RequestBodyParameters quest}) async {
    setState(() {
      loading = true;
    });
    await QuestionApi.setQuestion(
      path: "student10/reflextion",
      param: quest,
    ).then((value) {
      setState(() {
        loading = false;
      });
      if (value['message'] == "success") {
        successDialog();
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
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    q1Controller.dispose();
    q2Controller.dispose();
    q3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: LoadingBox(
          loading: loading,
          child: Container(
            width: _size.width,
            height: _size.height,
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "แบบสะท้อนการเรียนรู้ของวัยรุ่น",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "กิจกรรมที่ 10 เรื่อง การเห็นคุณค่าในตัวเอง",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "คำชี้แจง ให้วัยรุ่นเขียนสิ่งที่ได้เรียนรู้จากการศึกษา เรื่องการเห็นคุณค่าในตัวเอง",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: _size.width,
                        child: const Text(
                          "1. ท่านได้เรียนรู้อะไรจากการเรียนบทเรียนเรื่อง การเห็นคุณค่าในตัวเอง",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _textField(controller: q1Controller),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: _size.width,
                        child: const Text(
                          "2. ให้ท่านบอกข้อดีและข้อเสียของตนเองมา 3 ข้อ",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _textField(controller: q2Controller),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: _size.width,
                        child: const Text(
                          "3. ท่านจะวางแผนในการพัฒนา ข้อดีและข้อเสียของตัวท่านเอง อย่างไร",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _textField(controller: q3Controller),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  MainButton(
                    width: _size.width * 0.5,
                    ontab: onSetData,
                    borderRadius: 50,
                    title: widget.nextPage == widget.endPage
                        ? 'ส่งคำตอบ'
                        : "ถัดไป",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _textField({TextEditingController? controller}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        maxLines: 5,
        style: const TextStyle(fontSize: 12),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
