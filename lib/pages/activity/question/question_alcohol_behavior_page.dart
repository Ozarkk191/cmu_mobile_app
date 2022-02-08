import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';

class QuestionAlcoholBehaviorPage extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  const QuestionAlcoholBehaviorPage(
      {Key? key, required this.controller, required this.nextPage})
      : super(key: key);

  @override
  _QuestionAlcoholBehaviorPageState createState() =>
      _QuestionAlcoholBehaviorPageState();
}

class _QuestionAlcoholBehaviorPageState
    extends State<QuestionAlcoholBehaviorPage> {
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller3 = TextEditingController();
  late TextEditingController controller4 = TextEditingController();
  late TextEditingController controller5 = TextEditingController();
  String anwser1 = "";
  String anwser2 = "";
  String anwser3 = "";
  String anwser4 = "";
  String anwser5 = "";
  // bool value1 = false;
  // bool value2 = false;
  // bool value3 = false;
  // bool value4 = false;
  // bool value5 = false;

  @override
  void dispose() {
    controller1.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _size.width,
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
                      const Text(
                        'ส่วนที่ 2 พฤติกรรมการดื่มเครื่องดื่มแอลกอฮอล์',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: _size.width * 0.6,
                          child: Image.asset('assets/icons/exam.png'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _quiz1(),
                      _quiz2(),
                      _quiz3(),
                      _quiz4(),
                      _quiz5(),
                      const SizedBox(height: 40),
                      Center(
                        child: MainButton(
                          ontab: () {
                            widget.controller.jumpToPage(widget.nextPage);
                          },
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
    );
  }

  Column _quiz5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '5. ชนิดของเครื่องดื่มเครื่องดื่มแอลกอฮอล์ที่ท่านดื่ม',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'เหล้า',
          groupValue: anwser5,
          onChanged: (String? value) {
            setState(() {
              anwser5 = value!;
            });
          },
        ),
        _radioButton(
          title: 'เบียร์',
          groupValue: anwser5,
          onChanged: (String? value) {
            setState(() {
              anwser5 = value!;
            });
          },
        ),
        _radioButton(
          title: 'ไวน์ (สไปร์)',
          groupValue: anwser5,
          onChanged: (String? value) {
            setState(() {
              anwser5 = value!;
            });
          },
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          groupValue: anwser5,
          textField: true,
          controller: controller5,
          onChanged: (String? value) {
            setState(() {
              anwser5 = value!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _quiz4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '4. บุคคลที่ท่านดื่มเครื่องดื่มแอลกอฮอล์ด้วย',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'เพื่อน',
          groupValue: anwser4,
          onChanged: (String? value) {
            setState(() {
              anwser4 = value!;
            });
          },
        ),
        _radioButton(
          title: 'สมาชิกในครอบครัว',
          groupValue: anwser4,
          onChanged: (String? value) {
            setState(() {
              anwser4 = value!;
            });
          },
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          groupValue: anwser4,
          textField: true,
          controller: controller4,
          onChanged: (String? value) {
            setState(() {
              anwser4 = value!;
              // anwser4 = "$value ${controller4.text}";
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _quiz3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3. ในการดื่มแต่ละครั้ง ท่านดื่มปริมาณกี่หน่วยดื่มมาตราฐาน',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'น้อยกว่า 1 ดื่มมาตราฐาน',
          groupValue: anwser3,
          onChanged: (String? value) {
            setState(() {
              anwser3 = value!;
            });
          },
        ),
        _radioButton(
          title: '1-4 ดื่มมาตราฐาน',
          groupValue: anwser3,
          onChanged: (String? value) {
            setState(() {
              anwser3 = value!;
            });
          },
        ),
        _radioButton(
          title: '5 ดื่มมาตราฐานขึ้นไป',
          groupValue: anwser3,
          onChanged: (String? value) {
            setState(() {
              anwser3 = value!;
            });
          },
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          groupValue: anwser3,
          textField: true,
          controller: controller3,
          onChanged: (String? value) {
            setState(() {
              anwser3 = value!;
              // anwser4 = "$value ${controller4.text}";
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _quiz2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '2. ท่านดื่มเครื่องดื่มแอลกอฮอล์ครั้งล่าสุดเมื่อไหร่',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: '1 ปีที่ผ่านมา',
          groupValue: anwser2,
          onChanged: (String? value) {
            setState(() {
              anwser2 = value!;
            });
          },
        ),
        _radioButton(
          title: '1 เดือนที่ผ่านมา',
          groupValue: anwser2,
          onChanged: (String? value) {
            setState(() {
              anwser2 = value!;
            });
          },
        ),
        _radioButton(
          title: '1 สัปดาห์ที่ผ่านมา',
          groupValue: anwser2,
          onChanged: (String? value) {
            setState(() {
              anwser2 = value!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _quiz1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1. ตลอดชีวิตที่ผ่านมา ท่านเคยดื่มเครื่องดื่มแอลกอฮอล์หรือไหม (ไม่นับรวมจิบ/ชิมเพียงเล็กน้อย)',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'ไม่เคยดื่มเลย (ไม่ต้องทำข้อต่อไป)',
          groupValue: anwser1,
          onChanged: (String? value) {
            setState(() {
              anwser1 = value!;
            });
          },
        ),
        _radioButton(
          title: 'เคยดื่ม ดื่มครั้งแรกตอนอายุ',
          groupValue: anwser1,
          textField: true,
          suffix: 'ปี',
          onChanged: (String? value) {
            setState(() {
              anwser1 = value!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _radioButton({
    required String title,
    String suffix = "",
    required Function(String?) onChanged,
    required String groupValue,
    TextEditingController? controller,
    bool textField = false,
  }) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Radio(
            value: title,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 10),
          ),
          Visibility(
            visible: textField,
            child: SizedBox(
              width: 80,
              height: 40,
              child: TextField(
                controller: controller,
                style: const TextStyle(fontSize: 10),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 17),
                ),
              ),
            ),
          ),
          Text(
            suffix,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
