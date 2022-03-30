import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/all_user_model.dart';
import 'package:cmu_mobile_app/models/learning_model.dart';
import 'package:cmu_mobile_app/models/questions/reflex_model.dart';
import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/utils/quiz_list.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/layouts/main_layout.dart';

class ScoreReflexEvaluatePage extends StatefulWidget {
  final String title;
  final User user;
  final String subPath;
  final int index;
  const ScoreReflexEvaluatePage({
    Key? key,
    required this.title,
    required this.user,
    required this.subPath,
    required this.index,
  }) : super(key: key);

  @override
  State<ScoreReflexEvaluatePage> createState() =>
      _ScoreReflexEvaluatePageState();
}

class _ScoreReflexEvaluatePageState extends State<ScoreReflexEvaluatePage> {
  List<LearningModel> question = [];
  Future<Map<String, dynamic>?> getData() async {
    String path = "${widget.user.role}/${widget.subPath}/${widget.user.id}";
    log(path.toString());
    var res = await ScoreApi.getScore(path: path);
    log(res.toString());
    if (res["message"] == "success") {
      if (res[widget.subPath] == null) {
        Map<String, dynamic> data = {widget.subPath: "0"};
        return data;
      } else {
        return res[widget.subPath];
      }
    }
    return null;
  }

  void setWidget() {
    switch (widget.user.role) {
      case "student":
        question = teenReflex;
        break;
      case "teacher":
        question = teacherReflex;
        break;
      case "parent":
        question = parentReflex;
        break;
      case "monke":
        question = monkReflex;
        break;

      default:
        question = teenReflex;
    }
  }

  @override
  void initState() {
    setWidget();
    super.initState();
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
                Map<String, dynamic> data =
                    jsonDecode(jsonEncode(snapshot.data));
                if (data[widget.subPath] != "0") {
                  ReflexModel reflex = ReflexModel.fromJson(data);

                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          headText(question[widget.index].title!),
                          questionText(question[widget.index].subTitle!),
                          const SizedBox(height: 20),
                          questionText(question[widget.index].quiz![0]),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: answerText("คำตอบของท่านคือ  " + reflex.q1!),
                          ),
                          const SizedBox(height: 20),
                          questionText(question[widget.index].quiz![1]),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: answerText("คำตอบของท่านคือ  " + reflex.q2!),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("ไม่พบข้อมูล"),
                  );
                }
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
      ),
    );
  }

  Widget questionText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
      ),
    );
  }

  Widget headText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
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
