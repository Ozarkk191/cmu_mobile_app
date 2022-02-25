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
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
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
  bool loading = false;
  @override
  void initState() {
    onCheckType();

    super.initState();
  }

  void onCheckType() async {
    final data = await SharedPref.getStringPref(key: "user");
    Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
    switch (user["role"]) {
      case "student":
        path = await onTeenType();
        break;
      case "parent":
        path = await onParentType();
        break;
      case "teacher":
        path = await onTeacherType();
        break;
      case "monk":
        path = await onMonkType();
        break;
      default:
    }
    log("init==>$path");
  }

  Future<String> onParentType() async {
    log("widget==>${widget.learningModel.title}");
    if (widget.learningModel.title! == "แบบสะท้อนการเรียนรู้ของผู้ปกครอง") {
      switch (widget.learningModel.subTitle!) {
        case "กิจกรรมที่ 4 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการตัดสินใจ":
          return "parent4/reflextion";
        case "กิจกรรมที่ 5 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการควบคุมอารมณ์":
          return "parent5/reflextion";
        case "กิจกรรมที่ 6 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการปฏิเสธ":
          return "parent6/reflextion";
        case "กิจกรรมที่ 7 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการผ่อนคลายความเครียด":
          return "parent7/reflextion";
        case "กิจกรรมที่ 8 คุณธรรมสำคัญอย่างไร: หลักพรหมวิหาร 4 ความเมตตา กรุณา":
          return "parent8/reflextion";
        case "กิจกรรมที่ 9 คุณธรรมสำคัญอย่างไร: หลักพรหมวิหาร 4 มุทิตา อุเบกขา":
          return "parent9/reflextion";
        case "กิจกรรมที่ 10 เรื่อง การเห็นคุณค่าในตัวเอง":
          return "parent10/reflextion";
        default:
          return "";
      }
    } else {
      switch (widget.learningModel.title!) {
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 4":
          return "parent5/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 5":
          return "parent6/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 6":
          return "parent7/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 7":
          return "parent8/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 8":
          return "parent9/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 9":
          return "parent10/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 10":
          return "parent11/evaluate";
        default:
          return "";
      }
    }
  }

  Future<String> onTeenType() async {
    if (widget.learningModel.title! == "แบบสะท้อนการเรียนรู้ของวัยรุ่น") {
      switch (widget.learningModel.subTitle!) {
        case "กิจกรรมที่ 4 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการตัดสินใจ":
          return "student4";
        case "กิจกรรมที่ 5 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการควบคุมอารมณ์":
          return path = "student5/reflextion";
        case "กิจกรรมที่ 6 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการปฏิเสธ":
          return path = "student6/reflextion";
        case "กิจกรรมที่ 7 ทักษะชีวิตพิชิตแอลกอฮอล์: ทักษะการผ่อนคลายความเครียด":
          return path = "student7/reflextion";
        case "กิจกรรมที่ 8 คุณธรรมสำคัญอย่างไร: หลักพรหมวิหาร 4 ความเมตตา กรุณา":
          return path = "student8/reflextion";
        case "กิจกรรมที่ 9 คุณธรรมสำคัญอย่างไร: หลักพรหมวิหาร 4 มุทิตา อุเบกขา":
          return path = "student9/reflextion";
        case "กิจกรรมที่ 10 เรื่อง การเห็นคุณค่าในตัวเอง":
          return path = "student10/reflextion";
        default:
          return "";
      }
    } else {
      switch (widget.learningModel.title!) {
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 4":
          return path = "student5/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 5":
          return path = "student6/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 6":
          return path = "student7/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 7":
          return path = "student8/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 8":
          return path = "student9/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 9":
          return path = "student10/evaluate";
        default:
          return "";
      }
    }
  }

  Future<String> onTeacherType() async {
    if (widget.learningModel.title! == "แบบสะท้อนการเรียนรู้ของครู") {
      switch (widget.learningModel.subTitle!) {
        case "กิจกรรมที่ 4  เรื่อง บทบาทของครูในการป้องกันการดื่มแอลกอฮอล์ในนักเรียน":
          return "teacher4/reflextion";
        case "กิจกรรมที่ 5  เรื่อง การคัดกรองผู้ที่ติดสารเสพติด/ ดื่มเครื่องดื่มแอลกอฮอล์":
          return path = "teacher5/reflextion";
        case "กิจกรรมที่ 6  เรื่อง การให้คำปรึกษานักเรียนที่มีปัญหาการใช้สารเสพติด/แอลกอฮอล์":
          return path = "teacher6/reflextion";
        case "กิจกรรมที่ 7 เรื่อง การเฝ้าระวังและกำกับติดตามนักเรียนที่มีความเสี่ยงหรือดื่มแอลกอฮอล์":
          return path = "teacher7/reflextion";
        case "กิจกรรมที่ 8 เรื่อง การเห็นคุณค่าในตนเอง และการเสริมแรงเพื่อปรับพฤติกรรม":
          return path = "teacher8/reflextion";
        default:
          return "";
      }
    } else {
      switch (widget.learningModel.title!) {
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 4":
          return path = "teacher5/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 5":
          return path = "teacher6/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 6":
          return path = "teacher7/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 7":
          return path = "teacher8/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 8":
          return path = "teacher9/evaluate";
        default:
          return "";
      }
    }
  }

  Future<String> onMonkType() async {
    if (widget.learningModel.title! == "แบบสะท้อนการเรียนรู้ของพระสงฆ์") {
      switch (widget.learningModel.subTitle!) {
        case "กิจกรรมที่ 8 เรื่อง วัดปลอดสุรา (กฏหมายและกิจกรรมที่ทำได้ในวัด)":
          return "monk8/reflextion";
        case "กิจกรรมที่ 9 ธรรมเทศนานําใจ ป้องกันภัยจากสุรา":
          return path = "monk9/reflextion";
        case "กิจกรรมที่ 10 สื่อสารอย่างไรให้ญาติยมเข้าใจและห่างไกลจากสุรา  (เทคนิคการสื่อสารด้วยเสียงตามสาย)":
          return path = "monk10/reflextion";
        case "กิจกรรมที่ 11 การให้คำปรึกษาวัยรุ่นที่มีปัญหาการใช้สารเสพติด/แอลกอฮอล์":
          return path = "monk11/reflextion";
        default:
          return "";
      }
    } else {
      switch (widget.learningModel.title!) {
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 8":
          return path = "monk8/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 9":
          return path = "monk9/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 10":
          return path = "monk10/evaluate";
        case "การกำกับติดตามและประเมินผลการทำกิจกรรมที่ 11":
          return path = "monk11/evaluate";

        default:
          return "";
      }
    }
  }

  void onSetData() async {
    final data = await SharedPref.getStringPref(key: "user");
    Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
    reflexModel.userId = user["id"];
    reflexModel.q1 = "empty";
    reflexModel.q2 = "empty";
    if (controllerList[0].text.isNotEmpty) {
      reflexModel.q1 = controllerList[0].text;
    }
    if (controllerList[1].text.isNotEmpty) {
      reflexModel.q2 = controllerList[1].text;
    }

    onSave(quest: reflexModel);
  }

  void onSave({required RequestBodyParameters quest}) async {
    setState(() {
      loading = true;
    });
    await QuestionApi.setQuestion(
      path: path,
      param: quest,
    ).then((value) {
      log("$path ==> ${value['message']}");
      setState(() {
        loading = false;
      });
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
