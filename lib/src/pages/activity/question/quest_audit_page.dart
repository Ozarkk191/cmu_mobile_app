import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/models/questions/question3_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_radio_button.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
import 'package:flutter/material.dart';

class QuestAuditPage extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  final int endPage;
  final String type;
  const QuestAuditPage({
    Key? key,
    required this.controller,
    required this.nextPage,
    this.endPage = 1000,
    this.type = "post",
  }) : super(key: key);

  @override
  _QuestAuditPageState createState() => _QuestAuditPageState();
}

class _QuestAuditPageState extends State<QuestAuditPage> {
  late Question3Model question3 = Question3Model();
  String anwser1 = "";
  String anwser2 = "";
  String anwser3 = "";
  String anwser4 = "";
  String anwser5 = "";
  String anwser6 = "";
  String anwser7 = "";
  String anwser8 = "";
  String anwser9 = "";
  String anwser10 = "";
  bool loading = false;

  void onSave() async {
    setState(() {
      loading = true;
    });
    final data = await SharedPref.getStringPref(key: "user");
    Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
    question3.userId = user["id"];
    int total = question3.q1! +
        question3.q21! +
        question3.q22! +
        question3.q23! +
        question3.q3! +
        question3.q4! +
        question3.q5! +
        question3.q6! +
        question3.q7! +
        question3.q8! +
        question3.q9! +
        question3.q10!;

    question3.total = total;
    question3.type = widget.type;
    String path = user["role"];
    switch (path) {
      case "student":
        path = "question3";
        break;
      case "parent":
        path = "parent/question3";
        break;
      default:
    }
    log("${widget.endPage}");
    log("path ==>$path");

    await QuestionApi.setQuestion(path: path, param: question3).then((value) {
      if (value['message'] == "success") {
        setState(() {
          loading = false;
        });
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
      body: SafeArea(
        child: LoadingBox(
          loading: loading,
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
                        Text(
                          'ส่วนที่ ${widget.nextPage - 1}  แบบประเมินปัญหาการดื่มสุรา (AUDIT)',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        _text(context),
                        const SizedBox(height: 20),
                        quiz1(),
                        RichText(
                          text: TextSpan(
                            text: '',
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(
                                text: '2.เลือกตอบเพียง ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'ข้อเดียว',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' (ข้อ 2.1 หรือ 2.2 หรือ 2.3)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        quiz2(),
                        quiz3(),
                        quiz4(),
                        quiz5(),
                        quiz6(),
                        quiz7(),
                        quiz8(),
                        quiz9(),
                        quiz10(),
                        const SizedBox(height: 40),
                        Center(
                          child: MainButton(
                            ontab: onSave,
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
      ),
    );
  }

  Column quiz10() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '10.เคยมีแพทย์ หรือบุคลากรทางการแพทย์หรือเพื่อนฝูงหรือญาติพี่น้องแสดงความเป็นห่วงเป็นใยต่อการดื่มสุราของคุณหรือไม่',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser10,
          onChanged: (answer) {
            setState(() {
              anwser10 = answer!;
              question3.q10 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    เคย แต่ไม่ได้เกิดขึ้นในปีที่แล้ว',
          groupValue: anwser10,
          onChanged: (answer) {
            setState(() {
              anwser10 = answer!;
              question3.q10 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    เคยเกิดขึ้นในช่วงหนึ่งปีที่แล้ว',
          groupValue: anwser10,
          onChanged: (answer) {
            setState(() {
              anwser10 = answer!;
              question3.q10 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz9() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '9.ตัวคุณเองหรือคนอื่น เคยได้รับบาดเจ็บซึ่งเป็นผลจากการดื่มสุราของคุณหรือไม่',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser9,
          onChanged: (answer) {
            setState(() {
              anwser9 = answer!;
              question3.q9 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    เคย แต่ไม่ได้เกิดขึ้นในปีที่แล้ว',
          groupValue: anwser9,
          onChanged: (answer) {
            setState(() {
              anwser9 = answer!;
              question3.q9 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    เคยเกิดขึ้นในช่วงหนึ่งปีที่แล้ว',
          groupValue: anwser9,
          onChanged: (answer) {
            setState(() {
              anwser9 = answer!;
              question3.q9 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz8() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '8.ในช่วงปีที่แล้ว มีบ่อยเพียงไรที่คุณไม่สามารถจำได้ว่าเกิดอะไรขึ้นในคืนที่ผ่านมา เพราะว่าคุณได้ดื่มสุราเข้าไป',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question3.q8 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    น้อยกว่าเดือนละครั้ง',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question3.q8 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    เดือนละครั้ง',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question3.q8 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    สัปดาห์ละครั้ง',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question3.q8 = 3;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    ทุกวัน หรือเกือบทุกวัน',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question3.q8 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz7() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '7.ในช่วงหนึ่งปีที่แล้ว มีบ่อยเพียงไรที่คุณรู้สึกไม่ดี โกรธหรือเสียใจ เนื่องจากคุณได้ทำบางสิ่งบางอย่างลงไปในขณะที่คุณดื่มสุราเข้าไป',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question3.q7 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    น้อยกว่าเดือนละครั้ง',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question3.q7 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    เดือนละครั้ง',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question3.q7 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    สัปดาห์ละครั้ง',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question3.q7 = 3;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    ทุกวัน หรือเกือบทุกวัน',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question3.q7 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz6() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '6.ในช่วงหนึ่งปีที่แล้ว มีบ่อยเพียงไรที่คุณต้องรีบดื่มสุราทันทีในตอนเช้า เพื่อจะได้ดำเนินชีวิตตามปกติ หรือถอนอาการเมาค้างจากการดื่มหนักในคืนที่ผ่านมา',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question3.q6 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    น้อยกว่าเดือนละครั้ง',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question3.q6 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    เดือนละครั้ง',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question3.q6 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    สัปดาห์ละครั้ง',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question3.q6 = 3;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    ทุกวัน หรือเกือบทุกวัน',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question3.q6 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '5.ในช่วงหนึ่งปีที่แล้ว มีบ่อยเพียงไรที่คุณไม่ได้ทำสิ่งที่คุณควรจะทำตามปกติ เพราะคุณมัวแต่ไปดื่มสุราเสีย',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question3.q5 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    น้อยกว่าเดือนละครั้ง',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question3.q5 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    เดือนละครั้ง',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question3.q5 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    สัปดาห์ละครั้ง',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question3.q5 = 3;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    ทุกวัน หรือเกือบทุกวัน',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question3.q5 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '4.ในช่วงหนึ่งปีที่แล้ว มีบ่อยครั้งเพียงไรที่คุณพบว่าคุณไม่สามารถหยุดดื่มได้ หากคุณได้เริ่มดื่มไปแล้ว',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question3.q4 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    น้อยกว่าเดือนละครั้ง',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question3.q4 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    เดือนละครั้ง',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question3.q4 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    สัปดาห์ละครั้ง',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question3.q4 = 3;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    ทุกวัน หรือเกือบทุกวัน',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question3.q4 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3.บ่อยครั้งเพียงไรที่คุณดื่มเบียร์ 4 กระป๋องขึ้นไป หรือเหล้าวิสกี้ 3 เป๊กขึ้นไป',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question3.q3 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    น้อยกว่าเดือนละครั้ง',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question3.q3 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    เดือนละครั้ง',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question3.q3 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    สัปดาห์ละครั้ง',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question3.q3 = 3;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    ทุกวัน หรือเกือบทุกวัน',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question3.q3 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '   2.1 เวลาที่คุณดื่มสุรา โดยทั่วไปแล้วคุณดื่ม ประมาณเท่าไหร่ต่อวัน',
          style: TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: '(0)    1-2 ดื่มมาตรฐาน',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 0;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    3-4 ดื่มมาตรฐาน',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 1;
              question3.q22 = 0;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    5-6 ดื่มมาตรฐาน',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 2;
              question3.q22 = 0;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    7-9 ดื่มมาตรฐาน',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 3;
              question3.q22 = 0;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    ตั้งแต่ 10 ดื่มมาตราฐานขึ้นไป',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 4;
              question3.q22 = 0;
              question3.q23 = 0;
            });
          },
        ),
        const Text(
          '   2.2 ถ้าโดยทั่วไปดื่มเบียร์ เช่น สิงห์ ไฮเนเกน ลีโอ เชียร์ ไทเกอร์ ช้าง ดื่มประมาณเท่าไรต่อวัน',
          style: TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: '(0)    1-1.5 กระป่อง/ ½ - ¾ ขวด',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 0;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    2-3 กระป๋อง/1-1.5 ขวด',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 1;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    3.5-4 กระป๋อง/2 ขวด',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 2;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    4.5-7 กระป๋อง/3-4 ขวด',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 3;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    7 กระป๋อง/4 ขวดขึ้นไป',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 4;
              question3.q23 = 0;
            });
          },
        ),
        const Text(
          '   2.3 ถ้าโดยทั่วไปดื่มเหล้า เช่น แม่โขง หงส์ทอง หงส์ทิพย์ เหล้าขาว 40 ดีกรี ดื่มประมาณเท่าไรต่อวัน',
          style: TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: '(0)    2-3 ฝา',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 0;
              question3.q23 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    ¼ แบน',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 0;
              question3.q23 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    ½ แบน',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 0;
              question3.q23 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    4.5-7 กระป๋อง/3-4 ขวด',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 0;
              question3.q23 = 3;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    ¾ แบน',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question3.q21 = 0;
              question3.q22 = 0;
              question3.q23 = 4;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1. คุณดื่มสุราบ่อยเพียงไร',
          style: TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: '(0)    ไม่เคยเลย',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question3.q1 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '(1)    เดือนละครั้งหรือน้อยกว่า ',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question3.q1 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '(2)    2-4 ครั้งต่อเดือน',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question3.q1 = 2;
            });
          },
        ),
        MainRadioButton(
          title: '(3)    3-4 ครั้งต่อสัปดาห์',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question3.q1 = 3;
            });
          },
        ),
        MainRadioButton(
          title: '(4)    4 ครั้งขึ้นไปต่อสัปดาห์',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question3.q1 = 4;
            });
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
            text: ' โปรดตอบคำถามต่อไปนี้ตามความเป็นจริง โดยทำเลือก',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text:
                'คำตอบที่ตรงกับความเป็นจริงของท่านมากที่สุด โดย สุรา หมายถึง เครื่องดื่มแอลกอฮอล์ทุกชนิด ได้แก่ เบียร์ เหล้า สาโท กระแช่ วิสกี้ สปายไวน์ เป็นต้น ',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: 'คำตอบของท่านจะเป็นความลับ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ' กรุณาตอบคำถามตามความเป็นจริง',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
