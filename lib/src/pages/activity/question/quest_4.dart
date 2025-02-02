import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/questions/question4_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_radio_button.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
import 'package:flutter/material.dart';

class Quest4 extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  final int number;
  final String type;
  const Quest4({
    Key? key,
    required this.controller,
    required this.nextPage,
    this.type = "post",
    required this.number,
  }) : super(key: key);

  @override
  _Quest4State createState() => _Quest4State();
}

class _Quest4State extends State<Quest4> {
  late Question4Model question = Question4Model();
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
  String anwser11 = "";
  String anwser12 = "";
  bool loading = true;

  late Map<String, dynamic> user = <String, dynamic>{};
  Future<void> checkDoThis() async {
    final data = await SharedPref.getStringPref(key: "user");
    user = jsonDecode(data) as Map<String, dynamic>;
    String path = "";
    if (widget.type == "pre") {
      path = "${user["role"]}/question4/${user["id"]}";
    } else {
      path = "${user["role"]}/question4/${user["id"]}/post";
    }
    var res = await ScoreApi.getScore(path: path);
    if (res["question4"] != null) {
      widget.controller.jumpToPage(widget.nextPage);
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  void onSave() async {
    setState(() {
      loading = true;
    });
    final data = await SharedPref.getStringPref(key: "user");
    Map<String, dynamic> user = jsonDecode(data) as Map<String, dynamic>;
    question.userId = user["id"];
    question.type = widget.type;
    question.total = question.q1! +
        question.q2! +
        question.q3! +
        question.q4! +
        question.q5! +
        question.q6! +
        question.q7! +
        question.q8! +
        question.q9! +
        question.q10! +
        question.q11! +
        question.q12!;
    log(question.toJson().toString());

    await QuestionApi.setQuestion(
      path: "question4",
      param: question,
    ).then((value) {
      log("question4 =>${value['message']}\n${question.toJson()}");
      if (value['message'] == "success") {
        setState(() {
          loading = false;
        });
        successDialog();
      }
    });
  }

  void successDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                width: 1,
                color: const Color(0xffFF6600),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.check,
                    size: 50,
                    color: Color(0xffFF6600),
                  ),
                  Text(
                    "ส่งคำตอบเรียบร้อยแล้ว",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffFF6600),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    Timer(const Duration(seconds: 3), () {
      widget.controller.jumpToPage(widget.nextPage);
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    checkDoThis();
    super.initState();
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
                          'ส่วนที่ ${widget.number}  แบบวัดความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        _text(context),
                        const SizedBox(height: 20),
                        quiz1(),
                        quiz2(),
                        quiz3(),
                        quiz4(),
                        quiz5(),
                        quiz6(),
                        quiz7(),
                        quiz8(),
                        quiz9(),
                        quiz10(),
                        quiz11(),
                        quiz12(),
                        const SizedBox(height: 40),
                        Center(
                          child: MainButton(
                            ontab: onSave,
                            width: _size.width * 0.5,
                            borderRadius: 50,
                            title: 'ถัดไป',
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

  Column quiz12() {
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
                    '12. บทลงโทษสูงสุดของผู้กระทำความผิดในการขับรถขณะเมาสุราคือข้อใด',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: 'ยึดใบอนุญาตขับขี่รถ',
          groupValue: anwser12,
          onChanged: (answer) {
            setState(() {
              anwser12 = answer!;
              question.q12 = 1;
            });
          },
        ),
        MainRadioButton(
          title: 'ว่ากล่าวตักเตือน และปรับ 200 บาท',
          groupValue: anwser12,
          onChanged: (answer) {
            setState(() {
              anwser12 = answer!;
              question.q12 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'จำคุกไม่เกิน 1 ปี หรือปรับตั้งแต่ 5,000-20,000 บาท',
          groupValue: anwser12,
          onChanged: (answer) {
            setState(() {
              anwser12 = answer!;
              question.q12 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'จำคุกไม่เกิน 6 เดือน หรือปรับตั้งแต่ 5,000-10,000 บาท',
          groupValue: anwser12,
          onChanged: (answer) {
            setState(() {
              anwser12 = answer!;
              question.q12 = 0;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz11() {
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
                    '11. กฎหมายได้กำหนดให้ผู้ขับขี่รถทุกประเภทต้องมีระดับแอลกอฮอล์ในเลือดไม่เกินกี่ มิลลิกรัมเปอร์เซ็นต์ (mg%)',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: '50 mg %',
          groupValue: anwser11,
          onChanged: (answer) {
            setState(() {
              anwser11 = answer!;
              question.q11 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '60 mg %',
          groupValue: anwser11,
          onChanged: (answer) {
            setState(() {
              anwser11 = answer!;
              question.q11 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '70 mg %',
          groupValue: anwser11,
          onChanged: (answer) {
            setState(() {
              anwser11 = answer!;
              question.q11 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '80 mg %',
          groupValue: anwser11,
          onChanged: (answer) {
            setState(() {
              anwser11 = answer!;
              question.q11 = 0;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz10() {
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
                    '10. กฎหมายควบคุมเครื่องดื่มแอลกอฮอล์ ห้ามจำหน่ายเครื่องดื่มแอลกอฮอล์ให้แก่ผู้ที่มีอายุต่ำกว่ากี่ปี',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: '15 ปี',
          groupValue: anwser10,
          onChanged: (answer) {
            setState(() {
              anwser10 = answer!;
              question.q10 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '18 ปี',
          groupValue: anwser10,
          onChanged: (answer) {
            setState(() {
              anwser10 = answer!;
              question.q10 = 0;
            });
          },
        ),
        MainRadioButton(
          title: '20 ปี',
          groupValue: anwser10,
          onChanged: (answer) {
            setState(() {
              anwser10 = answer!;
              question.q10 = 1;
            });
          },
        ),
        MainRadioButton(
          title: '22 ปี',
          groupValue: anwser10,
          onChanged: (answer) {
            setState(() {
              anwser10 = answer!;
              question.q10 = 0;
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
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text:
                    '9. ชาวบ้านดื่มเหล้าขาว ในวัดเพื่อร่วมฉลองงานกฐิน  จะได้รับโทษตามมาตรา 31 แห่ง พรบ.ควบคุมการดื่มเครื่องดื่มแอลกอฮอล์หรือไม่อย่างไร',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: 'ไม่ต้องรับโทษ',
          groupValue: anwser9,
          onChanged: (answer) {
            setState(() {
              anwser9 = answer!;
              question.q9 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'จำคุกไม่เกิน 6 หรือปรับไม่เกิน 1 หมื่นบาท หรือทั้งจำทั้งปรับ',
          groupValue: anwser9,
          onChanged: (answer) {
            setState(() {
              anwser9 = answer!;
              question.q9 = 1;
            });
          },
        ),
        MainRadioButton(
          title: 'จำคุกไม่เกิน 6 หรือปรับไม่เกิน 2 หมื่นบาท หรือทั้งจำทั้งปรับ',
          groupValue: anwser9,
          onChanged: (answer) {
            setState(() {
              anwser9 = answer!;
              question.q9 = 0;
            });
          },
        ),
        MainRadioButton(
          title:
              'จำคุกไม่เกิน 1 ปีหรือปรับไม่เกิน 1 หมื่นบาท หรือทั้งจำทั้งปรับ',
          groupValue: anwser9,
          onChanged: (answer) {
            setState(() {
              anwser9 = answer!;
              question.q9 = 0;
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
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text:
                    '8. เมื่อมีเพื่อนมาชวนผู้ที่ติดสุราให้กลับไปดื่มสุราอีก ท่านจะให้คำแนะนำอย่างไร',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: 'ถ้าดื่มเล็กน้อยก็ไม่เป็นไร',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question.q8 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ให้บอกเพื่อนว่าเลิกดื่มแล้ว',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question.q8 = 1;
            });
          },
        ),
        MainRadioButton(
          title: 'ดื่มได้เพราะมียาควบคุมแล้ว',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question.q8 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ไปนั่งร่วมวงกับเพื่อนได้แต่ไม่ดื่ม',
          groupValue: anwser8,
          onChanged: (answer) {
            setState(() {
              anwser8 = answer!;
              question.q8 = 0;
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
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text:
                    '7. ผลกระทบของการดื่มเครื่อง ดื่มแอลกอฮอล์ต่อการใช้ชีวิตในปัจจุบันที่ ',
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
              TextSpan(
                text: ' คือข้อใด',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: 'ผลกระทบต่อสังคม',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question.q7 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ผลกระทบต่อเศรษฐกิจ',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question.q7 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ผลกระทบต่อสิ่งแวดล้อม',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question.q7 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ผลกระทบต่อตัวผู้ดื่ม และครอบครัว',
          groupValue: anwser7,
          onChanged: (answer) {
            setState(() {
              anwser7 = answer!;
              question.q7 = 1;
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
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text: '6. ผลกระทบทางเศรษฐกิจของการดื่มเครื่องดื่มแอลกอฮอล์ ',
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
              TextSpan(
                text: ' คือข้อใด',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: 'ความสูญเสียจากโรคเอดส์',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question.q6 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ความสูญเสียจากโรคมะเร็งตับ',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question.q6 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ความสูญเสียจากอุบัติเหตุจราจร',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question.q6 = 1;
            });
          },
        ),
        MainRadioButton(
          title: 'ความสูญเสียจากโรคพิษสุราเรื้อรัง',
          groupValue: anwser6,
          onChanged: (answer) {
            setState(() {
              anwser6 = answer!;
              question.q6 = 0;
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
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text: '5. การดื่มเครื่องดื่มแอลกอฮอล์ส่งผลกระทบต่อสังคม ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: 'ยกเว้น',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' ข้อใด',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: 'อาชญากรรม',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question.q5 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ชุมชนแออัด',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question.q5 = 1;
            });
          },
        ),
        MainRadioButton(
          title: 'อุบัติเหตุจากการเมาแล้วขับ',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question.q5 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ทะเลาะวิวาท ทำร้ายร่างกาย',
          groupValue: anwser5,
          onChanged: (answer) {
            setState(() {
              anwser5 = answer!;
              question.q5 = 0;
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
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text:
                    '4. ผู้ที่ดื่มเครื่องดื่มแอลกอฮอล์เสี่ยงต่อการเกิดโรคทางจิตเวช ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: 'ยกเว้น',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' ข้อใด',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: 'โรควิกลจริต',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question.q4 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'โรคซึมเศร้า',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question.q4 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'โรคความจำเสื่อม',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question.q4 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'โรคหวาดระแวง',
          groupValue: anwser4,
          onChanged: (answer) {
            setState(() {
              anwser4 = answer!;
              question.q4 = 1;
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
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text: '3. ข้อใด ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: 'ไม่ใช่',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' ผลจากการดื่มสุราเป็นประจำ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MainRadioButton(
          title: 'โรคตับแข็ง',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question.q3 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'โรคกระพาะอาหาร',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question.q3 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'โรคสมองเสื่อม',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question.q3 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'โรคภูมิคุ้มกันบกพร่อง',
          groupValue: anwser3,
          onChanged: (answer) {
            setState(() {
              anwser3 = answer!;
              question.q3 = 1;
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
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text:
                    '2. อวัยวะส่วนใดของร่างกาย ที่จะได้รับพิษจากการดื่มเครื่องดื่มแอลกอฮอล์ ',
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
        MainRadioButton(
          title: 'ไต',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question.q2 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'ตับ',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question.q2 = 1;
            });
          },
        ),
        MainRadioButton(
          title: 'สมอง',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question.q2 = 0;
            });
          },
        ),
        MainRadioButton(
          title: 'กระเพาะอาหาร',
          groupValue: anwser2,
          onChanged: (answer) {
            setState(() {
              anwser2 = answer!;
              question.q2 = 0;
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
          '1. เครื่องดื่มแอลกอฮอล์หมายถึงอะไร',
          style: TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title:
              'เครื่องดื่มที่มีอิสทานอลผสมอยู่ในปริมาณที่สามารถนำมาบริโภคได้',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question.q1 = 1;
            });
          },
        ),
        MainRadioButton(
          title:
              'เครื่องดื่มที่มีเมทิลแอลกอฮอล์ผสมอยู่ในปริมาณที่สามารถนำมาบริโภคได้',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question.q1 = 0;
            });
          },
        ),
        MainRadioButton(
          title:
              'เครื่องดื่มที่มีบิวทิลแอลกอฮอล์ผสมอยู่ในปริมาณที่สามารถนำมาบริโภคได้',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question.q1 = 0;
            });
          },
        ),
        MainRadioButton(
          title:
              'เครื่องดื่มที่มีไอโซโพรพิลแอลกอฮอล์ผสมอยู่ในปริมาณที่สามารถนำมาบริโภคได้',
          groupValue: anwser1,
          onChanged: (answer) {
            setState(() {
              anwser1 = answer!;
              question.q1 = 0;
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
            text: ' กรุณาเลือกข้อที่ท่านเห็นว่า ',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: 'ถูกต้องที่สุด',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
