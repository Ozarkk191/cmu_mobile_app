import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/models/questions/upsent_model.dart';
import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box2.dart';
import 'package:flutter/material.dart';

class NotDonePage extends StatefulWidget {
  final String role;
  const NotDonePage({Key? key, required this.role}) : super(key: key);

  @override
  State<NotDonePage> createState() => _NotDonePageState();
}

class _NotDonePageState extends State<NotDonePage> {
  List<UpSentModel> teen = [];
  String header = "";
  bool loading = true;

  void getData() async {
    await QuestionApi.getUpSent().then((value) {
      if (value["message"] == "success") {
        if (widget.role == "student") {
          header = "กลุ่มวัยรุ่น";
          value["result"]["teen"].keys.forEach((key) {
            String name = teenWording(key);
            List<dynamic> nameList = value["result"]["teen"][key];
            UpSentModel data = UpSentModel(
              name: name,
              nameList: nameList,
            );
            teen.add(data);
          });
        } else if (widget.role == "parent") {
          header = "กลุ่มผู้ปกครอง";
          value["result"]["parent"].keys.forEach((key) {
            String name = parentWording(key);
            List<dynamic> nameList = value["result"]["parent"][key];
            UpSentModel data = UpSentModel(
              name: name,
              nameList: nameList,
            );
            teen.add(data);
          });
        }
      }
    });
    setState(() {
      loading = false;
    });
  }

  String teenWording(String text) {
    switch (text) {
      case "student1":
        return "แบบทดสอบ กิจกรรมที่ 1";
      case "student2":
        return "แบบทดสอบ กิจกรรมที่ 2";
      case "student3":
        return "แบบทดสอบ กิจกรรมที่ 3";
      case "student4_reflextions":
        return "แบบสะท้อนการเรียนรู้ของวัยรุ่น \nกิจกรรมที่ 4";
      case "student5_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 4";
      case "student5_reflextions":
        return "แบบสะท้อนการเรียนรู้ของวัยรุ่น \nกิจกรรมที่ 5";
      case "student6_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 5";
      case "student6_reflextions":
        return "แบบสะท้อนการเรียนรู้ของวัยรุ่น \nกิจกรรมที่ 6";
      case "student7_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 6";
      case "student7_reflextions":
        return "แบบสะท้อนการเรียนรู้ของวัยรุ่น \nกิจกรรมที่ 7";
      case "student8_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 7";
      case "student8_reflextions":
        return "แบบสะท้อนการเรียนรู้ของวัยรุ่น \nกิจกรรมที่ 8";
      case "student9_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 8";
      case "student9_reflextions":
        return "แบบสะท้อนการเรียนรู้ของวัยรุ่น \nกิจกรรมที่ 9";
      default:
        return "";
    }
  }

  String parentWording(String text) {
    switch (text) {
      case "parent_question2s":
        return "แบบทดสอบ กิจกรรมที่ 1";
      case "parent_question3s":
        return "แบบทดสอบ กิจกรรมที่ 2";
      case "parent4_reflextions":
        return "แบบสะท้อนการเรียนรู้ของผู้ปกครอง \nกิจกรรมที่ 4";
      case "parent5_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 4";
      case "parent5_reflextions":
        return "แบบสะท้อนการเรียนรู้ของผู้ปกครอง \nกิจกรรมที่ 5";
      case "parent6_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 5";
      case "parent6_reflextions":
        return "แบบสะท้อนการเรียนรู้ของผู้ปกครอง \nกิจกรรมที่ 6";
      case "parent7_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 6";
      case "parent7_reflextions":
        return "แบบสะท้อนการเรียนรู้ของผู้ปกครอง \nกิจกรรมที่ 7";
      case "parent8_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 7";
      case "parent8_reflextions":
        return "แบบสะท้อนการเรียนรู้ของผู้ปกครอง \nกิจกรรมที่ 8";
      case "parent9_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 8";
      case "parent9_reflextions":
        return "แบบสะท้อนการเรียนรู้ของผู้ปกครอง \nกิจกรรมที่ 9";
      case "parent10_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 9";
      case "parent10_reflextions":
        return "แบบสะท้อนการเรียนรู้ของผู้ปกครอง \nกิจกรรมที่ 10";
      case "parent11_evaluates":
        return "การกำกับติดตามและประเมินผลการทำ\nกิจกรรมที่ 10";
      default:
        return "";
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: LoadingBox2(
          loading: loading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppbar(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: "รายชื่อคนที่ยังไม่ได้ทำกิจกรรม",
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    header,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: teen.length,
                    itemBuilder: (context, index) {
                      return item(
                        index: index,
                        context: context,
                        data: teen[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column item({
    required int index,
    required BuildContext context,
    required UpSentModel data,
  }) {
    return Column(
      children: [
        Theme(
          data: ThemeData(
            dividerColor: Colors.transparent,
            primaryColor: Colors.orange,
            primarySwatch: Colors.orange,
            // fontFamily: "Prompt",
          ),
          child: ExpansionTile(
            collapsedBackgroundColor: Colors.green.shade100,
            backgroundColor: Colors.green.shade100,
            title: Text(
              data.name!.toUpperCase(),
              style: const TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${index + 1}. ${data.nameList![index]}"),
                            const SizedBox(height: 5),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
                color: Colors.white,
              )
            ],
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
