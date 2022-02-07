import 'package:cmu_mobile_app/pages/home/home_page.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class QuestionPage2 extends StatefulWidget {
  final String activityName;
  final String groupName;
  final PageController controller;
  final int nextPage;
  final int? endPage;
  const QuestionPage2({
    Key? key,
    required this.activityName,
    required this.groupName,
    required this.controller,
    required this.nextPage,
    this.endPage,
  }) : super(key: key);

  @override
  _QuestionPage2State createState() => _QuestionPage2State();
}

class _QuestionPage2State extends State<QuestionPage2> {
  String title = "แบบสะท้อนการเรียนรู้ของ";
  String subActivity = "";
  String fullActivity = "";
  @override
  void initState() {
    if (widget.activityName.contains("&&")) {
      var str0 = widget.activityName.split("&&");
      title = str0[0];
      if (str0[1].contains(":")) {}
      var str = str0[1].split(":");
      subActivity = str[1];
      var str2 = str0[1].split(" ");
      fullActivity = str2[2] + " " + subActivity;
    }

    super.initState();
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
                  "แบบสะท้อนการเรียนรู้ของ${widget.groupName}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.activityName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "คำชี้แจง ให้${widget.groupName}เขียนสิ่งที่ได้เรียนรู้จากการศึกษา$fullActivity",
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "1. ท่านได้เรียนรู้อะไรจากการเรียนบทเรียนเรื่อง $subActivity",
                ),
                const SizedBox(
                  height: 5,
                ),
                _textField(),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "2. ท่านคิดว่าจะนำความรู้ที่ได้ในเรื่อง $subActivity ไปใช้ในชีวิตประจำวันได้อย่างไรบ้าง",
                ),
                const SizedBox(
                  height: 5,
                ),
                _textField(),
                const SizedBox(
                  height: 40,
                ),
                MainButton(
                  width: _size.width * 0.5,
                  ontab: () {
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
                  },
                  borderRadius: 50,
                  title: 'ส่งคำตอบ',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _textField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        maxLines: 5,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
