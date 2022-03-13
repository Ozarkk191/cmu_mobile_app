import 'package:cmu_mobile_app/src/pages/scores/score_type/reflex_evaluate/score_reflex_evaluate_page.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

import '../../../../../models/all_user_model.dart';
import '../../../../widgets/appbar/custom_appbar.dart';

class ListReflexEvaluatePage extends StatefulWidget {
  final User user;
  final String role;
  const ListReflexEvaluatePage({
    Key? key,
    required this.user,
    required this.role,
  }) : super(key: key);

  @override
  State<ListReflexEvaluatePage> createState() => _ListReflexEvaluatePageState();
}

class _ListReflexEvaluatePageState extends State<ListReflexEvaluatePage> {
  List<String> list = [];
  List<String> subPathList = [];
  List<String> listStudent = [
    "กิจกรรมที่ 4 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 5 กำกับติดตามกิจกรรมที่ 4",
    "กิจกรรมที่ 5 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 6 กำกับติดตามกิจกรรมที่ 5",
    "กิจกรรมที่ 6 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 7 กำกับติดตามกิจกรรมที่ 6",
    "กิจกรรมที่ 7 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 8 กำกับติดตามกิจกรรมที่ 7",
    "กิจกรรมที่ 8 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 9 กำกับติดตามกิจกรรมที่ 8",
    "กิจกรรมที่ 9 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 10 กำกับติดตามกิจกรรมที่ 9",
    "กิจกรรมที่ 10 สะท้อนการเรียบนรู้",
  ];
  List<String> listTeacherParent = [
    "กิจกรรมที่ 4 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 5 กำกับติดตามกิจกรรมที่ 4",
    "กิจกรรมที่ 5 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 6 กำกับติดตามกิจกรรมที่ 5",
    "กิจกรรมที่ 6 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 7 กำกับติดตามกิจกรรมที่ 6",
    "กิจกรรมที่ 7 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 8 กำกับติดตามกิจกรรมที่ 7",
    "กิจกรรมที่ 8 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 9 กำกับติดตามกิจกรรมที่ 8",
  ];
  List<String> listMonk = [
    "กิจกรรมที่ 8 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 9 กำกับติดตามกิจกรรมที่ 8",
    "กิจกรรมที่ 9 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 10 กำกับติดตามกิจกรรมที่ 9",
    "กิจกรรมที่ 10 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 11 กำกับติดตามกิจกรรมที่ 10",
    "กิจกรรมที่ 11 สะท้อนการเรียบนรู้",
    "กิจกรรมที่ 12 กำกับติดตามกิจกรรมที่ 11",
  ];
  List<String> subPathStudent = [
    "reflex4",
    "eval5",
    "reflex5",
    "eval6",
    "reflex6",
    "eval7",
    "reflex7",
    "eval8",
    "reflex8",
    "eval9",
    "reflex9",
    "eval10",
    "reflex10",
  ];
  List<String> subPathTeacher = [
    "reflex4",
    "eval5",
    "reflex5",
    "eval6",
    "reflex6",
    "eval7",
    "reflex7",
    "eval8",
    "reflex8",
    "eval9",
  ];
  List<String> subPathMonk = [
    "reflex8",
    "eval9",
    "reflex9",
    "eval10",
    "reflex10",
    "eval11",
    "reflex11",
    "eval12",
  ];

  Future<List<String>> selecteList() async {
    switch (widget.role) {
      case "student":
      case "parent":
        subPathList = subPathStudent;
        return listStudent;
      case "teacher":
        subPathList = subPathTeacher;
        return listTeacherParent;
      case "monk":
        subPathList = subPathMonk;
        return listMonk;
      default:
        subPathList = subPathStudent;
        return listStudent;
    }
  }

  void getList() async {
    list = await selecteList();
    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'แบบสอบถามสะท้อนและติดตามการเรียนรู้',
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScoreReflexEvaluatePage(
                                title: index % 2 == 0
                                    ? "สะท้อนการเรียบนรู้"
                                    : "กำกับติดตามการเรียบนรู้",
                                subPath: subPathList[index],
                                user: widget.user,
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(list[index])),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
