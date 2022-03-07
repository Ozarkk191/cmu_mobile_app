import 'dart:developer';

import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:cmu_mobile_app/models/questions/question2_model.dart';
import 'package:flutter/material.dart';

import '../../../models/body_parameters.dart';
import '../../../models/questions/question14_model.dart';
import '../../../models/questions/question20_model.dart';
import '../../../models/questions/question3_model.dart';
import '../../../models/questions/question4_model.dart';
import '../../../utils/assessment_list.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/layouts/main_layout.dart';

class ScorePage extends StatefulWidget {
  final String id;
  final String role;
  final String nameQuestion;
  final String title;
  const ScorePage({
    Key? key,
    required this.id,
    required this.role,
    required this.nameQuestion,
    required this.title,
  }) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  Widget page = Container();
  @override
  void initState() {
    getTypeQuestion();
    super.initState();
  }

  void getTypeQuestion() async {
    Map<String, dynamic> data = await getData();
    switch (widget.nameQuestion) {
      case "question2":
        Question2Model question = Question2Model.fromJson(data["question2"]);
        page = question2Page(question);
        break;
      case "question3":
        Question3Model question = Question3Model.fromJson(data["question3"]);
        page = question3Page(question);
        break;
      case "question4":
        Question4Model question = Question4Model.fromJson(data["question4"]);
        page = question4Page(question);
        break;
      case "question5":
        QuestionModel20 question = QuestionModel20.fromJson(data["question5"]);
        page = question5Page(question);
        break;
      case "question6":
        QuestionModel14 question = QuestionModel14.fromJson(data["question6"]);
        page = question6Page(question);
        break;
      case "question7":
        QuestionModel20 question = QuestionModel20.fromJson(data["question7"]);
        page = question7Page(question);
        break;
      case "question8":
        QuestionModel14 question = QuestionModel14.fromJson(data["question8"]);
        page = question8Page(question);
        break;
      default:
        Question2Model question = Question2Model.fromJson(data["question2"]);
        page = question2Page(question);
        break;
    }
    setState(() {});
  }

  Future<Map<String, dynamic>> getData() async {
    String path = "${widget.role}/${widget.nameQuestion}/${widget.id}";
    log("path :: $path");
    var res = await ScoreApi.getScore(path: path);
    log(res.toString());
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SingleChildScrollView(
          child: Column(children: [
            CustomAppbar(
              onTap: () {
                Navigator.pop(context);
              },
              title: widget.title,
            ),
            page,
          ]),
        ),
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

  Widget headText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Widget question2Page(Question2Model question) {
    List<String> quest1 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ ไม่เคยดื่มเลย",
      "คำตอบของท่านคือ เคยดื่ม"
    ];
    List<String> quest2 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ 1 ปีที่ผ่านมา",
      "คำตอบของท่านคือ 1 เดือนที่ผ่านมา",
      "คำตอบของท่านคือ 1 สัปดาห์ที่ผ่านมา"
    ];
    List<String> quest3 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ น้อยกว่า 1 ดื่มมาตราฐาน",
      "คำตอบของท่านคือ 5 ดื่มมาตราฐานขึ้นไป",
      "คำตอบของท่านคือ"
    ];
    List<String> quest4 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ เพื่อน",
      "คำตอบของท่านคือ สมาชิกในครอบครัว",
      "คำตอบของท่านคือ"
    ];
    List<String> quest5 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ เหล้า",
      "คำตอบของท่านคือ เบียร์",
      "คำตอบของท่านคือ ไวน์ (สไปร์)",
      "คำตอบของท่านคือ",
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionText(
              "1. ตลอดชีวิตที่ผ่านมา ท่านเคยดื่มเครื่องดื่มแอลกอฮอล์หรือไหม (ไม่นับรวมจิบ/ชิมเพียงเล็กน้อย)"),
          question.q1 == 2
              ? answerText(
                  "${quest1[question.q1!]} ดื่มครั้งแรกตอนอายุ ${question.q1Comment} ปี")
              : answerText(quest1[question.q1!]),
          questionText("2. ท่านดื่มเครื่องดื่มแอลกอฮอล์ครั้งล่าสุดเมื่อไหร่"),
          answerText(quest2[question.q2!]),
          questionText(
              "3. ในการดื่มแต่ละครั้ง ท่านดื่มปริมาณกี่หน่วยดื่มมาตราฐาน"),
          question.q3 == 2
              ? answerText("${quest3[question.q3!]}  ${question.q3Comment}")
              : answerText(quest3[question.q3!]),
          questionText("4. บุคคลที่ท่านดื่มเครื่องดื่มแอลกอฮอล์ด้วย"),
          question.q4 == 2
              ? answerText("${quest4[question.q4!]}  ${question.q4Comment}")
              : answerText(quest4[question.q4!]),
          questionText("5. ชนิดของเครื่องดื่มเครื่องดื่มแอลกอฮอล์ที่ท่านดื่ม"),
          question.q5 == 3
              ? answerText("${quest5[question.q5!]}  ${question.q5Comment}")
              : answerText(quest5[question.q5!]),
        ],
      ),
    );
  }

  Widget question3Page(Question3Model qusetion) {
    List<String> q1 = [
      "คำตอบของท่านคือ ไม่เคยเลย",
      "คำตอบของท่านคือ เดือนละครั้งหรือ น้อยกว่า",
      "คำตอบของท่านคือ 2-4 ครั้งต่อเดือน",
      "คำตอบของท่านคือ 2-3 ครั้งต่อสัปดาห์",
      "คำตอบของท่านคือ 4 ครั้งขึ้นไปต่อสัปดาห์",
    ];

    List<String> q21 = [
      "คำตอบของท่านคือ 1-2ดื่มมาตรฐาน",
      "คำตอบของท่านคือ 3-4ดื่มมาตรฐาน",
      "คำตอบของท่านคือ 5-6ดื่มมาตรฐาน",
      "คำตอบของท่านคือ 7-9ดื่มมาตรฐาน",
      "คำตอบของท่านคือ ตั้งแต่ 10 ดื่มมาตราฐานขึ้นไป",
    ];
    List<String> q22 = [
      "คำตอบของท่านคือ 1-1.5 กระป่อง/1/2-3/4 ขวด",
      "คำตอบของท่านคือ 2-3 กระป๋อง/1-1.5 ขวด",
      "คำตอบของท่านคือ 3.5-4 กระป๋อง/2 ขวด",
      "คำตอบของท่านคือ 4.5-7 กระป๋อง/3-4 ขวด",
      "คำตอบของท่านคือ 7 กระป๋อง/4 ขวดขึ้นไป",
    ];
    List<String> q23 = [
      "คำตอบของท่านคือ 2-3 ฝา",
      "คำตอบของท่านคือ ¼ แบน",
      "คำตอบของท่านคือ ½ แบน",
      "คำตอบของท่านคือ ¾ แบน",
      "คำตอบของท่านคือ 1 แบนขึ้นไป"
    ];
    List<String> q3 = [
      "คำตอบของท่านคือ ไม่เคยเลย",
      "คำตอบของท่านคือ น้อยกว่าเดือนละครั้ง",
      "คำตอบของท่านคือ เดือนละครั้ง",
      "คำตอบของท่านคือ สัปดาห์ละครั้ง",
      "คำตอบของท่านคือ ทุกวัน หรือ เกือบทุกวัน",
    ];
    List<String> q4 = [
      "คำตอบของท่านคือ ไม่เคยเลย",
      "คำตอบของท่านคือ น้อยกว่าเดือนละครั้ง",
      "คำตอบของท่านคือ เดือนละครั้ง",
      "คำตอบของท่านคือ สัปดาห์ละครั้ง",
      "คำตอบของท่านคือ ทุกวัน หรือ เกือบทุกวัน",
    ];

    List<String> qList = [
      "คำตอบของท่านคือ ไม่เคยเลย",
      "คำตอบของท่านคือ เคย แต่ไม่ได้เกิด ขึ้นในปีที่แล้ว",
      "คำตอบของท่านคือ เคยเกิดขึ้นในช่วงหนึ่งปีที่แล้ว",
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionText("1. คุณดื่มสุราบ่อยเพียงไร"),
          answerText(q1[qusetion.q1!]),
          headText("2.เลือกตอบเพียงข้อเดียวเวลาที่คุณดื่มสุรา"),
          questionText("2.1 โดยทั่วไปแล้วคุณดื่มประมาณเท่าไหร่ต่อวัน"),
          answerText(q21[qusetion.q21!]),
          questionText(
              "2.2 โดยทั่วไปดื่มเบียร์ เช่น สิงห์ ไฮเนเกน ลีโอ เชียร์ ไทเกอร์ ช้าง ดื่มประมาณเท่าไรต่อวัน"),
          answerText(q22[qusetion.q22!]),
          questionText(
              "2.3 โดยทั่วไปดื่มเหล้า เช่น แม่โขง หงส์ทอง หงส์ทิพย์ เหล้าขาว 40 ดีกรี ดื่มประมาณเท่าไร ต่อวัน"),
          answerText(q23[qusetion.q23!]),
          questionText(
              "3. บ่อยครั้งเพียงไรที่คุณดื่มเบียร์ 4 กระป๋องขึ้นไป หรือเหล้าวิสกี้ 3 เป๊กขึ้นไป"),
          answerText(q3[qusetion.q3!]),
          questionText(
              "4. ในช่วงหนึ่งปีที่แล้ว มีบ่อยครั้งเพียงไรที่คุณพบว่าคุณไม่สามารถหยุดดื่มได้ หากคุณได้เริ่มดื่มไปแล้ว"),
          answerText(q4[qusetion.q4!]),
          questionText(
              "5. ในช่วงหนึ่งปีที่แล้ว มีบ่อยเพียงไรที่คุณไม่ได้ทำสิ่งที่คุณควรจะทำตาม ปกติ เพราะคุณมัวแต่ไปดื่มสุราเสีย"),
          answerText(q4[qusetion.q5!]),
          questionText(
              "6. ในช่วงหนึ่งปีที่แล้ว มีบ่อยเพียงไรที่คุณต้องรีบดื่มสุราทันทีในตอนเช้า เพื่อจะได้ดำเนินชีวิตตามปกติ หรือถอนอาการเมาค้างจากการดื่มหนักในคืนที่ผ่านมา"),
          answerText(q4[qusetion.q6!]),
          questionText(
              "7. ในช่วงหนึ่งปีที่แล้ว มีบ่อยเพียงไรที่คุณรู้สึกไม่ดี โกรธหรือเสียใจ เนื่องจาก คุณได้ทำบางสิ่งบางอย่างลงไปในขณะ ที่คุณดื่มสุราเข้าไป"),
          answerText(q4[qusetion.q7!]),
          questionText(
              "8. ในช่วงปีที่แล้ว มีบ่อยเพียงไรที่คุณไม่สามารถจำได้ว่าเกิดอะไรขึ้นในคืนที่ผ่านมา เพราะว่าคุณได้ดื่มสุราเข้าไป"),
          answerText(q4[qusetion.q8!]),
          questionText(
              "9. ตัวคุณเองหรือคนอื่น เคยได้รับบาดเจ็บซึ่งเป็นผลจากการดื่มสุราของคุณหรือไม่"),
          answerText(qList[qusetion.q8!]),
          questionText(
              "10. เคยมีแพทย์หรือบุคลากรทาง การแพทย์หรือเพื่อนฝูงหรือญาติพี่น้อง แสดงความเป็นห)วงเป็นใยต่อการดื่ม สุราของคุณหรือไม่"),
          answerText(qList[qusetion.q8!]),
          Center(
            child: headText("คะแนนรวม ${qusetion.total}"),
          )
        ],
      ),
    );
  }

  Widget question4Page(Question4Model qusetion) {
    List<String> q1 = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ เครื่องดื่มที่มีอิสทานอลผสมอยู่ในปริมาณที่สามารถนำมาบริโภคได้",
      "คำตอบของท่านคือ เครื่องดื่มที่มีเมทิลแอลกอฮอล์ผสมอยู่ในปริมาณที่สามารถนำมาบริโภคได้",
      "คำตอบของท่านคือ เครื่องดื่มที่มีบิวทิลแอลกอฮอล์ผสมอยู่ในปริมาณที่สามารถนำมาบริโภคได้",
      "คำตอบของท่านคือ เครื่องดื่มที่มีไอโซโพรพิลแอลกอฮอล์ผสมอยู่ในปริมาณที่สามารถนำมาบริโภคได้",
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionText("1. เครื่องดื่มแอลกอฮอล์หมายถึงอะไร"),
          answerText(q1[qusetion.q1!]),
          questionText(
              "2. อวัยวะส่วนใดของร่างกาย ที่จะได้รับพิษจากการดื่มเครื่องดื่มแอลกอฮอล์ มากที่สุด"),
          qusetion.q2 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[1].choice![qusetion.q2!]),
          questionText("3. ข้อใด ไม่ใช่ ผลจากการดื่มสุราเป็นประจำ"),
          qusetion.q3 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[2].choice![qusetion.q3!]),
          questionText(
              "4. ผู้ที่ดื่มเครื่องดื่มแอลกอฮอล์เสี่ยงต่อการเกิดโรคทางจิตเวช ยกเว้น ข้อใด"),
          qusetion.q4 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[3].choice![qusetion.q4!]),
          questionText(
              "5. การดื่มเครื่องดื่มแอลกอฮอล์ส่งผลกระทบต่อสังคม ยกเว้น ข้อใด"),
          qusetion.q5 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[4].choice![qusetion.q5!]),
          questionText(
              "6. ผลกระทบทางเศรษฐกิจของการดื่มเครื่องดื่มแอลกอฮอล์ มากที่สุด คือข้อใด"),
          qusetion.q6 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[5].choice![qusetion.q6!]),
          questionText(
              "7. ผลกระทบของการดื่มเครื่อง ดื่มแอลกอฮอล์ต่อการใช้ชีวิตในปัจจุบันที่สำคัญ มากที่สุด คือข้อใด"),
          qusetion.q7 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[6].choice![qusetion.q7!]),
          questionText(
              "8. เมื่อมีเพื่อนมาชวนผู้ที่ติดสุราให้กลับไปดื่มสุราอีก ท่านจะให้คำแนะนำอย่างไร"),
          qusetion.q8 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[7].choice![qusetion.q8!]),
          questionText(
              "9. ชาวบ้านดื่มเหล้าขาว ในวัดเพื่อร่วมฉลองงานกฐิน  จะได้รับโทษตามมาตรา 31 แห่ง พรบ.ควบคุมการดื่มเครื่องดื่มแอลกอฮอล์หรือไม่อย่างไร"),
          qusetion.q9 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[8].choice![qusetion.q9!]),
          questionText(
              "10. กฎหมายควบคุมเครื่องดื่มแอลกอฮอล์ ห้ามจำหน่ายเครื่องดื่มแอลกอฮอล์ให้แก่ผู้ที่มีอายุต่ำกว่ากี่ปี"),
          qusetion.q10 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[9].choice![qusetion.q10!]),
          questionText(
              "11. กฎหมายได้กำหนดให้ผู้ขับขี่รถทุกประเภทต้องมีระดับแอลกอฮอล์ในเลือดไม่เกินกี่ มิลลิกรัมเปอร์เซ็นต์ (mg%)"),
          qusetion.q11 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[10].choice![qusetion.q11!]),
          questionText(
              "12. บทลงโทษสูงสุดของผู้กระทำความผิดในการขับรถขณะเมาสุราคือข้อใด"),
          qusetion.q12 == 0
              ? answerText("ไม่ได้ตอบคำถามนี้")
              : answerText("คำตอบของท่านคือ " +
                  aboutAlcoholList[11].choice![qusetion.q12!]),
        ],
      ),
    );
  }

  Widget question5Page(QuestionModel20 qusetion) {
    List<String> answer = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ ไม่เห็นด้วยอย่างยิ่ง",
      "คำตอบของท่านคือ ไม่เห็นด้วย",
      "คำตอบของท่านคือ เห็นด้วย",
      "คำตอบของท่านคือ เห็นด้วยอย่างยิ่ง",
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionText("1. การดื่มเครื่องดื่มแอลกอฮอล์อาจส่งผลเสียต่อสุขภาพ"),
          answerText(answer[qusetion.q1!]),
          questionText(
              "2. การดื่มเครื่องดื่มแอลกอฮอล์อาจก่อให้เกิดประโยชน์มากกว่าโทษ"),
          answerText(answer[qusetion.q2!]),
          questionText("3. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้สติสัมปชัญญะลดลง"),
          answerText(answer[qusetion.q3!]),
          questionText(
              "4. การดื่มเครื่องดื่มแอลกอฮอล์อาจนำไปสู่การมีเรื่องทะเลาะวิวาทได้"),
          answerText(answer[qusetion.q4!]),
          questionText(
              "5. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้ประสิทธิภาพการทำงานลดลง"),
          answerText(answer[qusetion.q5!]),
          questionText(
              "6. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้มีโอกาสได้เพื่อนเพิ่มขึ้น"),
          answerText(answer[qusetion.q6!]),
          questionText(
              "7. การดื่มเครื่องดื่มแอลกอฮอล์ช่วยทำให้ลืมเรื่องไม่สบายใจ"),
          answerText(answer[qusetion.q7!]),
          questionText("8. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้มีความสนุกสนาน"),
          answerText(answer[qusetion.q8!]),
          questionText(
              "9. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้มีโอกาสเสี่ยงที่จะมีเพศสัมพันธ์ได้ง่ายขึ้น"),
          answerText(answer[qusetion.q9!]),
          questionText(
              "10. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้คนอื่นรังเกียจเพราะปากและลมหายใจมีกลิ่นเหม็น"),
          answerText(answer[qusetion.q10!]),
          questionText(
              "11. คนอื่นอาจมองว่าฉันเป็นคนเกเรหากฉันดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q11!]),
          questionText(
              "12. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้รู้สึกมีความมั่นใจในตัวเองมากขึ้น"),
          answerText(answer[qusetion.q12!]),
          questionText(
              "13. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้รู้สึกว่าโตเป็นผู้ใหญ่ขึ้น"),
          answerText(answer[qusetion.q13!]),
          questionText(
              "14. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้รู้สึกเท่ห์ทันสมัย"),
          answerText(answer[qusetion.q14!]),
          questionText(
              "15. ฉันรู้สึกอึดอัดเมื่อต้องพูดคุยกับเพื่อนที่กำลังดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q15!]),
          questionText("16. วัยรุ่นอย่างฉันไม่ควรดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q16!]),
          questionText(
              "17. หากเพื่อนสนิทของฉันดื่มเครื่องดื่มแอลกอฮอล์   ฉันควรปล่อยให้เขาดื่มตามต้องการโดยไม่กล่าวตักเตือนใด ๆ"),
          answerText(answer[qusetion.q17!]),
          questionText(
              "18. การดื่มเครื่องดื่มแอลกอฮอล์จะทำให้ฉันกล้าแสดง ออกต่อหน้ากลุ่มคนมากขึ้น"),
          answerText(answer[qusetion.q18!]),
          questionText(
              "19. ฉันควรหลีกเลี่ยงที่จะนั่งอยู่ในกลุ่มเพื่อนที่กำลังดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q19!]),
          questionText(
              "20. ฉันคิดว่าเป็นเรื่องปกติ หากฉันจะทดลองดื่มเครื่อง ดื่มแอลกอฮอล์สักครั้ง"),
          answerText(answer[qusetion.q20!]),
        ],
      ),
    );
  }

  Widget question6Page(QuestionModel14 qusetion) {
    List<String> answer = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ มั่นใจอย่างยิ่ง",
      "คำตอบของท่านคือ ค่อนข้างมั่นใจ",
      "คำตอบของท่านคือ ค่อนข้างไม่มั่นใจ",
      "คำตอบของท่านคือ ไม่มั่นใจเลย",
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionText("1. กำลังโกรธ"),
          answerText(answer[qusetion.q1!]),
          questionText("2. อยู่ในงานเลี้ยงสังสรรค์"),
          answerText(answer[qusetion.q2!]),
          questionText("3. มีคนคะยั้นคะยอให้ดื่ม"),
          answerText(answer[qusetion.q3!]),
          questionText("4. รู้สึกหงุดหงิดไม่พอใจ"),
          answerText(answer[qusetion.q4!]),
          questionText("5. อยู่กับแฟนฉันที่กำลังนั่งดื่ม"),
          answerText(answer[qusetion.q5!]),
          questionText("6. รู้สึกกังวลใจ"),
          answerText(answer[qusetion.q6!]),
          questionText("7. อยู่ตามลำพัง"),
          answerText(answer[qusetion.q7!]),
          questionText("8. อยู่กับเพื่อนที่กำลังดื่ม"),
          answerText(answer[qusetion.q8!]),
          questionText("9. รู้สึกผิดหวัง"),
          answerText(answer[qusetion.q9!]),
          questionText("10. ฉลองความสำเร็จหรือชัยชนะ"),
          answerText(answer[qusetion.q10!]),
          questionText("11. อยู่ในสถานบันเทิง"),
          answerText(answer[qusetion.q11!]),
          questionText("12. รู้สึกท้อแท้"),
          answerText(answer[qusetion.q12!]),
          questionText("13. รู้สึกตื่นเต้นกระวนกระวายใจ"),
          answerText(answer[qusetion.q13!]),
          questionText("14. รู้สึกเศร้า"),
          answerText(answer[qusetion.q14!]),
        ],
      ),
    );
  }

  Widget question7Page(QuestionModel20 qusetion) {
    List<String> answer = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ บ่อยที่สุด",
      "คำตอบของท่านคือ บ่อย",
      "คำตอบของท่านคือ ปานกลาง",
      "คำตอบของท่านคือ น้อย",
      "คำตอบของท่านคือ น้อยที่สุด",
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionText(
              "1. พ่อ/แม่ให้ฉันหัดดื่มเครื่องดื่มแอลกอฮอล์ เพื่อให้รู้จักมารยาททางสังคม"),
          answerText(answer[qusetion.q1!]),
          questionText(
              "2. พ่อ/แม่ของฉันจะดื่มเครื่องดื่มแอลกอฮอล์ให้ฉันเห็นเป็นประจำ"),
          answerText(answer[qusetion.q2!]),
          questionText(
              "3. พ่อ/แม่บอกฉันว่าปัจจุบันนี้ไม่ว่าผู้หญิงหรือผู้ชายต้องดื่มเครื่องดื่มแอลกอฮอล์ให้เป็น เพื่อจะได้ไม่ถูกคนอื่นหลอก"),
          answerText(answer[qusetion.q3!]),
          questionText(
              "4. พ่อ/แม่พูดกับฉันว่าการดื่มเครื่องดื่มแอลกอฮอล์เป็นสิ่งไม่ดี"),
          answerText(answer[qusetion.q4!]),
          questionText(
              "5. เมื่อพ่อ/แม่ของฉันดื่มเครื่องดื่มแอลกอฮอล์ก็มักชวนฉันเข้ามาร่วมกิจกรรมด้วยเสมอ เช่น นั่งคุย กินกับแกล้ม หรือแม้กระทั่งชวนดื่มเครื่องดื่มแอลกอฮอล์ด้วย"),
          answerText(answer[qusetion.q5!]),
          questionText("6. พ่อ/แม่มักใช้ฉันไปซื้อเครื่องดื่มแอลกอฮอล์ให้เสมอ"),
          answerText(answer[qusetion.q6!]),
          questionText(
              "7. พ่อ/แม่จะพูดถึงโทษการดื่มเครื่องดื่มแอลกอฮอล์ให้ฉันฟังเสมอ"),
          answerText(answer[qusetion.q7!]),
          questionText(
              "8. พ่อ/แม่พูดกับฉันว่าท่านไม่ชอบคนที่ดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q8!]),
          questionText(
              "9. พ่อ/แม่มักถามเพื่อนๆและบุคคลรอบข้างของฉันเสมอว่า“ฉันดื่มเครื่องดื่มแอลกอฮอล์หรือไม่”"),
          answerText(answer[qusetion.q9!]),
          questionText(
              "10. เมื่อมีงานเลี้ยงสังสรรค์พ่อ/แม่มักให้อิสระกับฉันที่จะเลือกเครื่องดื่มเอง และท่านจะไม่ว่าหากฉันเลือกที่จะดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q10!]),
          questionText(
              "11. พ่อ/แม่ให้เงินฉันใช้จ่ายอย่างเพียงพอที่จะซื้ออะไรก็ได้ที่ต้องการ รวมทั้งเครื่องดื่มแอลกอฮอล์ด้วย"),
          answerText(answer[qusetion.q11!]),
          questionText(
              "12. พ่อ/แม่ของฉันบอกฉันว่าจะทำโทษฉัน ถ้าหากพบฉันดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q12!]),
          questionText(
              "13. พ่อ/แม่ของฉันมักพูดให้ฉันได้ยินเสมอว่าจะตัดค่าใช้จ่ายของพี่หรือของฉันหากรู้ว่าดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q13!]),
          questionText(
              "14. พ่อ/แม่ของฉันมักสอดส่องพฤติกรรมฉันเสมอในเรื่องที่เกี่ยวกับการดื่มเครื่องดื่มที่ผสมแอลกอฮอล์"),
          answerText(answer[qusetion.q14!]),
          questionText(
              "15. พ่อ/แม่มักบอกให้ฉันเลิกคบเพื่อนที่ดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q15!]),
          questionText(
              "16. พ่อ/แม่จะไม่ดุ หรือลงโทษฉันเมื่อฉันดื่มเครื่องดื่มแอลกอฮอล์ ถ้าไม่ทำให้เสียการเรียน"),
          answerText(answer[qusetion.q16!]),
          questionText(
              "17. พ่อ/แม่จะไม่อนุญาตให้ฉันไปงานเลี้ยงสังสรรค์ในกลุ่มเพื่อนหากงานเลี้ยงนั้นไม่มีครู หรือผู้ใหญ่ที่ท่านไว้ใจอยู่"),
          answerText(answer[qusetion.q17!]),
          questionText(
              "18. พ่อ/แม่ไม่เคยกล่าวคำขอโทษเมื่อดุด่าฉันโดยเข้าใจผิด"),
          answerText(answer[qusetion.q18!]),
          questionText(
              "19. พ่อ/แม่มักปล่อยให้ฉันไปเที่ยวหรือออกนอกบ้านกับเพื่อนได้อย่างอิสระ"),
          answerText(answer[qusetion.q19!]),
          questionText(
              "20. พ่อ/แม่จะดุด่าหรือลงโทษพี่และน้องเสมอ เมื่อทราบว่าพวกเขาดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q20!]),
        ],
      ),
    );
  }

  Widget question8Page(QuestionModel14 qusetion) {
    List<String> answer = [
      "ไม่ได้ตอบคำถามนี้",
      "คำตอบของท่านคือ ไม่ดื่มแน่นอน",
      "คำตอบของท่านคือ ไม่ดื่ม",
      "คำตอบของท่านคือ ไม่แน่ใจ",
      "คำตอบของท่านคือ ดื่ม",
      "คำตอบของท่านคือ ดื่มแน่นอน",
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionText(
              "1. เมื่อเพื่อนชวนท่านให้ดื่มเครื่องดื่มแอลกอฮอล์ขณะไปร่วมงานวันเกิด/งานเลี้ยง/งานกีฬาสี/งานประจำปีของโรงเรียน ฯลฯ"),
          answerText(answer[qusetion.q1!]),
          questionText("2. เมื่อท่านถูกรุ่นพี่ชวนให้ดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q2!]),
          questionText(
              "3. เมื่อแฟนของท่านชักชวนให้ดื่มเครื่องดื่มแอลกอฮอล์ด้วยกัน"),
          answerText(answer[qusetion.q3!]),
          questionText("4. เครียดเนื่องจากสอบได้คะแนนน้อย"),
          answerText(answer[qusetion.q4!]),
          questionText("5. ทะเลาะกับพ่อแม่/พี่น้อง"),
          answerText(answer[qusetion.q5!]),
          questionText("6. มีปัญหากับแฟน (ทะเลาะ, ถูกบอกเลิก)"),
          answerText(answer[qusetion.q6!]),
          questionText("7. เห็นพ่อแม่ตั้งวงดื่มเครื่องดื่มแอลกอฮอล์กับเพื่อนๆ"),
          answerText(answer[qusetion.q7!]),
          questionText("8. เห็นครูดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q8!]),
          questionText("9. พบเห็นโฆษณาเกี่ยวกับเครื่องดื่มแอลกอฮอล์ที่น่าลอง"),
          answerText(answer[qusetion.q9!]),
          questionText(
              "10. เห็นดาราที่ชื่นชอบโฆษณาเกี่ยวกับเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q10!]),
          questionText(
              "11. พบเห็นบู๊ทประชาสัมพันธ์เกี่ยวกับเครื่องดื่มแอลกอฮอล์ โดยมีการลดแลกแจกแถมสินค้ามากมาย"),
          answerText(answer[qusetion.q11!]),
          questionText("12. ผู้ใหญ่ยื่นเครื่องดื่มแอลกอฮอล์ให้ทดลอง"),
          answerText(answer[qusetion.q12!]),
          questionText(
              "13. เพื่อนคะยั้นคะยอให้ดื่มเครื่องดื่มแอลกอฮอล์ ขณะไปร่วมงานฉลองหลังสอบเสร็จ ทั้งที่ได้ปฏิเสธไปแล้ว"),
          answerText(answer[qusetion.q13!]),
          questionText(
              "14. เมื่อท่านถูกเพื่อนยื่นคำขาดว่าจะเลิกคบ หากท่านไม่ยอมดื่มเครื่องดื่มแอลกอฮอล์"),
          answerText(answer[qusetion.q14!]),
        ],
      ),
    );
  }
}
