import 'package:cmu_mobile_app/models/quiz_model.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/utils/assessment_list.dart';
import 'package:cmu_mobile_app/utils/quiz_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';

import '../../home/home_page.dart';

class QusetionPage extends StatefulWidget {
  final String prePost;
  final String quizType;
  final PageController controller;
  final int nextPage;
  final int? endPage;

  const QusetionPage({
    Key? key,
    required this.prePost,
    required this.quizType,
    required this.controller,
    required this.nextPage,
    this.endPage,
  }) : super(key: key);

  @override
  _QusetionPageState createState() => _QusetionPageState();
}

class _QusetionPageState extends State<QusetionPage> {
  late List<QuizModel> _list;

  void _checkQuiz() {
    switch (widget.quizType) {
      case "ความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์":
        _list = alcoholQuizList;
        break;
      case "ความรู้เกี่ยวกับกฏหมายควบคุมเครื่องดื่มแอลกอฮอล์":
        _list = lowQuizList;
        break;
      case "ความรู้เกี่ยวกับพัฒนาการของวัยรุ่น":
        _list = teenQuizList;
        break;
      case "แบบประเมินปัญหาการดื่มสุรา (AUDIT)":
        _list = alcoholAssessmentList;
        break;
      case "แบบวัดความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์":
        _list = aboutAlcoholList;
        break;
      case "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์":
        _list = alcoholList;
        break;
      case "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์":
        _list = rejectAlcoholList;
        break;
      case "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่":
        _list = parentAlcoholList;
        break;
      case "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์":
        _list = noAlcoholList;
        break;
      case "แบบวัดความมีคุณค่าในตนเอง":
        _list = selfWorthList;
        break;

      default:
    }
  }

  @override
  void initState() {
    _checkQuiz();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xfffbd4b9),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: MediaQuery.of(context).size.width,
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
                Text(
                  widget.quizType,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              _list[index].quiz!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          FlutterRadioGroup(
                            titles: _list[index].choice!,
                            labelStyle: const TextStyle(color: Colors.white38),
                            labelVisible: false,
                            activeColor: const Color(0xffFF6600),
                            titleStyle: const TextStyle(fontSize: 12),
                            orientation: RGOrientation.VERTICAL,
                            onChanged: (_index) {
                              setState(() {
                                _list[index].selecteChoice = _index!;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                MainButton(
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
                  title:
                      widget.nextPage == widget.endPage ? "ส่งคำตอบ" : 'ถัดไป',
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
