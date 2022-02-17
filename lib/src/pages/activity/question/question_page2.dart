import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:cmu_mobile_app/models/learning_model.dart';
import 'package:cmu_mobile_app/models/questions/reflex_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class QuestionPage2 extends StatefulWidget {
  final LearningModel learningModel;
  final PageController controller;
  final int nextPage;
  final int? endPage;
  const QuestionPage2({
    Key? key,
    required this.controller,
    required this.nextPage,
    this.endPage,
    required this.learningModel,
  }) : super(key: key);

  @override
  _QuestionPage2State createState() => _QuestionPage2State();
}

class _QuestionPage2State extends State<QuestionPage2> {
  late ReflexModel reflexModel = ReflexModel();
  List<TextEditingController> controllerList = [];
  String path = "";
  @override
  void initState() {
    onCheckType();
    log("init//:" + path);
    super.initState();
  }

  void onCheckType() async {
    if (widget.learningModel.title! == "แบบสะท้อนการเรียนรู้ของวัยรุ่น") {
      switch (widget.learningModel.subTitle!) {
        case "กิจกรรมที่ 4 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการตัดสินใจ":
          path = "student4";
          break;
        case "กิจกรรมที่ 5 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการควบคุมอารมณ์":
          path = "student5/reflextion";
          break;
        case "กิจกรรมที่ 6 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการปฏิเสธ":
          path = "student6/reflextion";
          break;
        case "กิจกรรมที่ 7 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการผ่อนคลายความเครียด":
          path = "student7/reflextion";
          break;
        case "กิจกรรมที่ 8 คุณธรรมสำคัญอย่างไร: หลักพรหมวิหาร 4 ความเมตตา กรุณา":
          path = "student8/reflextion";
          break;
        case "กิจกรรมที่ 9 คุณธรรมสำคัญอย่างไร: หลักพรหมวิหาร 4 มุทิตา อุเบกขา":
          path = "student9/reflextion";
          break;
        case "กิจกรรมที่ 10 เรื่อง การเห็นคุณค่าในตัวเอง":
          path = "student10/reflextion";
          break;
        default:
      }
    } else if (widget.learningModel.title!
        .contains("การกำกับติดตามและประเมินผลการทำกิจกรรมที่")) {
      switch (widget.learningModel.title!) {
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 4":
          path = "student5/evaluate";
          break;
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 5":
          path = "student6/evaluate";
          break;
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 6":
          path = "student7/evaluate";
          break;
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 7":
          path = "student8/evaluate";
          break;
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 8":
          path = "student9/evaluate";
          break;
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 9":
          path = "student10/evaluate";
          break;

        default:
      }
    }
  }

  void onSetData() async {
    final data = await SharedPref.getStringPref(key: "user");
    Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
    reflexModel.userId = user["id"];
    reflexModel.q1 = controllerList[0].text;
    reflexModel.q2 = controllerList[1].text;
    onSave(quest: reflexModel);
  }

  void onSave({required RequestBodyParameters quest}) async {
    await QuestionApi.setQuestion(
      path: path,
      param: quest,
    ).then((value) {
      log("$path ==> ${value['message']}");
      if (value['message'] == "success") {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
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
                Text(
                  widget.learningModel.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.learningModel.subTitle!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "คำชี้แจง ${widget.learningModel.statment}",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.learningModel.quiz!.length,
                  itemBuilder: (context, index) {
                    controllerList.add(TextEditingController());
                    return Column(
                      children: [
                        SizedBox(
                          width: _size.width,
                          child: Text(
                            widget.learningModel.quiz![index],
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _textField(controller: controllerList[index]),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    );
                  },
                ),
                MainButton(
                  width: _size.width * 0.5,
                  ontab: onSetData,
                  borderRadius: 50,
                  title:
                      widget.nextPage == widget.endPage ? 'ส่งคำตอบ' : "ถัดไป",
                )
              ],
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
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
