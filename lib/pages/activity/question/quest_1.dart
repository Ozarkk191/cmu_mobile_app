import 'package:cmu_mobile_app/pages/home/home_page.dart';
import 'package:cmu_mobile_app/utils/quiz_list.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_radio_button.dart';
import 'package:flutter/material.dart';

class Quest1 extends StatefulWidget {
  final String prePost;
  final PageController controller;
  final int nextPage;
  final int endPage;
  const Quest1({
    Key? key,
    required this.prePost,
    required this.controller,
    required this.nextPage,
    this.endPage = 1000,
  }) : super(key: key);

  @override
  _Quest1State createState() => _Quest1State();
}

class _Quest1State extends State<Quest1> {
  List<String> anwserList = [];

  void addList() {
    for (var i = 0; i < alcoholQuizList.length; i++) {
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
                  "ความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      alcoholQuizList[0].quiz!,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    quiz(
                      choice: alcoholQuizList[0].choice!,
                      answer: anwserList[0],
                      onChanged: (val) {
                        setState(() {
                          anwserList[0] = val!;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                '2. อวัยวะส่วนใดของร่างกายที่จะได้รับพิษจากการดื่มสุรา ',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'มากที่สุด',
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
                      choice: alcoholQuizList[1].choice!,
                      answer: anwserList[1],
                      onChanged: (val) {
                        setState(() {
                          anwserList[1] = val!;
                        });
                      },
                    ),
                    Text(
                      alcoholQuizList[2].quiz!,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    quiz(
                      choice: alcoholQuizList[2].choice!,
                      answer: anwserList[2],
                      onChanged: (val) {
                        setState(() {
                          anwserList[2] = val!;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                '4. ผลกระทบของการดื่มสุราต่อการใช้ชีวิตในปัจจุบันที่ ',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'สําคัญมากที่สุด',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: 'คือข้อใด',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    quiz(
                      choice: alcoholQuizList[3].choice!,
                      answer: anwserList[3],
                      onChanged: (val) {
                        setState(() {
                          anwserList[3] = val!;
                        });
                      },
                    ),
                    Text(
                      alcoholQuizList[4].quiz!,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    quiz(
                      choice: alcoholQuizList[4].choice!,
                      answer: anwserList[4],
                      onChanged: (val) {
                        setState(() {
                          anwserList[4] = val!;
                        });
                      },
                    ),
                    Text(
                      alcoholQuizList[5].quiz!,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    quiz(
                      choice: alcoholQuizList[5].choice!,
                      answer: anwserList[5],
                      onChanged: (val) {
                        setState(() {
                          anwserList[5] = val!;
                        });
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
