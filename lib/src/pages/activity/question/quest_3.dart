import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_radio_button.dart';
import 'package:cmu_mobile_app/utils/quiz_list.dart';
import 'package:flutter/material.dart';

class Quest3 extends StatefulWidget {
  final String prePost;
  final PageController controller;
  final int nextPage;
  final int endPage;
  const Quest3({
    Key? key,
    required this.prePost,
    required this.controller,
    required this.nextPage,
    this.endPage = 1000,
  }) : super(key: key);

  @override
  State<Quest3> createState() => _Quest3State();
}

class _Quest3State extends State<Quest3> {
  List<String> anwserList = [];

  void addList() {
    for (var i = 0; i < teenQuizList.length; i++) {
      anwserList.add("");
    }
    setState(() {});
  }

  @override
  void initState() {
    addList();
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
                                lowQuizList[index].quiz!,
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
