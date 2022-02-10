import 'package:cmu_mobile_app/models/quiz_model.dart';
import 'package:cmu_mobile_app/pages/home/home_page.dart';
import 'package:cmu_mobile_app/utils/assessment_list.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_radio_button.dart';
import 'package:flutter/material.dart';

class Quest5 extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  final String quizType;
  // final String quizType;
  final int endPage;
  const Quest5({
    Key? key,
    required this.controller,
    required this.nextPage,
    required this.quizType,
    this.endPage = 1000,
  }) : super(key: key);

  @override
  _Quest5State createState() => _Quest5State();
}

class _Quest5State extends State<Quest5> {
  List<String> anwserList = [];
  String subTitle = "";

  late List<QuizModel> _list;

  void _checkQuiz() {
    switch (widget.quizType) {
      case "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์":
        _list = alcoholList;
        addList(alcoholList);
        subTitle = "ท่านมีความคิดเห็นต่อการดื่มเครื่องดื่มแอลกอฮอล์อย่างไร";
        break;
      case "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์":
        _list = rejectAlcoholList;
        addList(rejectAlcoholList);
        subTitle = "ท่านมั่นใจว่าจะไม่ดื่มสุราในสถานการณ์ดังต่อไปนี้";
        break;
      case "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่":
        _list = parentAlcoholList;
        addList(parentAlcoholList);
        break;
      case "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์":
        _list = noAlcoholList;
        addList(noAlcoholList);
        break;
      case "แบบวัดความมีคุณค่าในตนเอง":
        _list = selfWorthList;
        addList(selfWorthList);
        break;

      default:
    }
  }

  void addList(List<QuizModel> list) {
    for (var i = 0; i < list.length; i++) {
      anwserList.add("");
    }
    setState(() {});
  }

  @override
  void initState() {
    _checkQuiz();
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
                const SizedBox(height: 20),
                SizedBox(
                  width: _size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // widget.quizType ==
                      //         "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์"
                      //     ?
                      Text(
                        'ส่วนที่ ${widget.nextPage - 1} ${widget.quizType}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // : Center(
                      //     child: Text(
                      //       widget.quizType,
                      //       style: const TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      widget.quizType ==
                              "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์"
                          ? _text(context)
                          : widget.quizType ==
                                  "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์"
                              ? _text6(context)
                              : widget.quizType ==
                                      "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่"
                                  ? _text7(context)
                                  : widget.quizType ==
                                          "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์"
                                      ? _text8(context)
                                      : Container(),
                      const SizedBox(height: 20),
                      widget.quizType ==
                              "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์"
                          ? _textSub(context)
                          : Text(
                              subTitle,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return quiz(
                            title: _list[index].quiz!,
                            choice: _list[index].choice!,
                            answer: anwserList[index],
                            onChanged: (val) {
                              setState(() {
                                anwserList[index] = val!;
                              });
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: MainButton(
                          ontab: () {
                            if (widget.nextPage == widget.endPage) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePage(initPage: 0),
                                ),
                              );
                            } else {
                              widget.controller.jumpToPage(widget.nextPage);
                            }
                          },
                          width: _size.width * 0.5,
                          borderRadius: 50,
                          title: widget.nextPage == widget.endPage
                              ? "ส่งคำตอบ"
                              : 'ถัดไป',
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column quiz({
    required String title,
    required List<String> choice,
    required String answer,
    required Function(String? val) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
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

  RichText _text(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'คำชี้แจง ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                ' แบบวัดนี้เป็นแบบสอบถามเกี่ยวกับความรู้สึกนึกคิดของท่านที่มีต่อการดื่มเครื่องดื่มแอลกอฮอล์ กรุณาตัดสินใจว่าท่านเห็นด้วยหรือไม่เห็นด้วยมากน้อยแค่ไหนกับข้อความข้างล่างนี้ โดยเลือกคำตอบที่ตรงกับความรู้สึกของท่านตามความเป็นจริงให้มากที่สุด',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  RichText _text6(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'คำชี้แจง ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                ' กรุณาทำเลือกข้อที่ตรงกับความรู้สึกของท่านมากที่สุดเพียงคำตอบเดียว',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  RichText _text7(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'คำชี้แจง ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                ' กรุณาทำเลือกข้อที่ท่านคิดว่าตรงกับความเป็นจริงของตัวท่านมากที่สุด',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  RichText _text8(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'คำชี้แจง ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                ' แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์ เป็นแบบวัดความพร้อมของท่านที่จะหลีกเลี่ยง   การดื่มเครื่องดื่มแอลกอฮอล์ในสถานการณ์ที่ชักนำไปสู่การดื่มเครื่องดื่มแอลกอฮอล์ กรุณาทำเลือกข้อที่ตรงกับระดับความตั้งใจของท่านมากที่สุด',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  RichText _textSub(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'ท่านมั่นใจว่าจะ ',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: 'ไม่ดื่ม',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: ' สุราในสาถานการณ์ดังต่อไปนี้',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
