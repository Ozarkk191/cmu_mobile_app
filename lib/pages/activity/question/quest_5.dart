import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_radio_button.dart';
import 'package:flutter/material.dart';

class Quest5 extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  const Quest5({
    Key? key,
    required this.controller,
    required this.nextPage,
  }) : super(key: key);

  @override
  _Quest5State createState() => _Quest5State();
}

class _Quest5State extends State<Quest5> {
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
  String anwser13 = "";
  String anwser14 = "";
  String anwser15 = "";
  String anwser16 = "";
  String anwser17 = "";
  String anwser18 = "";
  String anwser19 = "";
  String anwser20 = "";
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
                      const Text(
                        'ส่วนที่ 5 แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      _text(context),
                      const SizedBox(height: 20),
                      const Text(
                        'ท่านมีความคิดเห็นต่อการดื่มเครื่องดื่มแอลกอฮอล์อย่างไร',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      quiz1(
                        title:
                            '1. การดื่มเครื่องดื่มแอลกอฮอล์อาจส่งผลเสียต่อสุขภาพ',
                      ),
                      quiz2(
                        title:
                            '2. การดื่มเครื่องดื่มแอลกอฮอล์อาจก่อให้เกิดประโยชน์มากกว่าโทษ',
                      ),
                      quiz3(
                        title:
                            '3. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้สติสัมปชัญญะลดลง',
                      ),
                      quiz4(
                        title:
                            '4. การดื่มเครื่องดื่มแอลกอฮอล์อาจนำไปสู่การมีเรื่องทะเลาะวิวาทได้',
                      ),
                      quiz5(
                        title:
                            '5. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้ประสิทธิภาพการทำงานลดลง',
                      ),
                      quiz6(
                        title:
                            '6. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้มีโอกาสได้เพื่อนเพิ่มขึ้น',
                      ),
                      quiz7(
                        title:
                            '7. การดื่มเครื่องดื่มแอลกอฮอล์ช่วยทำให้ลืมเรื่องไม่สบายใจ',
                      ),
                      quiz8(
                        title:
                            '8. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้มีความสนุกสนาน',
                      ),
                      quiz9(
                        title:
                            '9. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้มีโอกาสเสี่ยงที่จะมีเพศสัมพันธ์ได้ง่ายขึ้น',
                      ),
                      quiz10(
                        title:
                            '10. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้คนอื่นรังเกียจเพราะปากและลมหายใจมีกลิ่นเหม็น',
                      ),
                      quiz11(
                        title:
                            '11. คนอื่นอาจมองว่าฉันเป็นคนเกเรหากฉันดื่มเครื่องดื่มแอลกอฮอล์',
                      ),
                      quiz12(
                        title:
                            '12. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้รู้สึกมีความมั่นใจในตัวเองมากขึ้น',
                      ),
                      quiz13(
                        title:
                            '13. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้รู้สึกว่าโตเป็นผู้ใหญ่ขึ้น',
                      ),
                      quiz14(
                        title:
                            '14. การดื่มเครื่องดื่มแอลกอฮอล์ทำให้รู้สึกเท่ห์ทันสมัย',
                      ),
                      quiz15(
                        title:
                            '15. ฉันรู้สึกอึดอัดเมื่อต้องพูดคุยกับเพื่อนที่กำลังดื่มเครื่องดื่มแอลกอฮอล์',
                      ),
                      quiz16(
                        title:
                            '16. วัยรุ่นอย่างฉันไม่ควรดื่มเครื่องดื่มแอลกอฮอล์',
                      ),
                      quiz17(
                        title:
                            '17. หากเพื่อนสนิทของฉันดื่มเครื่องดื่มแอลกอฮอล์   ฉันควรปล่อยให้เขาดื่มตามต้องการโดยไม่กล่าวตักเตือนใด ๆ',
                      ),
                      quiz18(
                        title:
                            '18. การดื่มเครื่องดื่มแอลกอฮอล์จะทำให้ฉันกล้าแสดง ออกต่อหน้ากลุ่มคนมากขึ้น',
                      ),
                      quiz19(
                        title:
                            '19.ฉันควรหลีกเลี่ยงที่จะนั่งอยู่ในกลุ่มเพื่อนที่กำลังดื่มเครื่องดื่มแอลกอฮอล์',
                      ),
                      quiz20(
                        title:
                            '20. ฉันคิดว่าเป็นเรื่องปกติ หากฉันจะทดลองดื่มเครื่อง ดื่มแอลกอฮอล์สักครั้ง',
                      ),
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

  Column quiz20({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser20,
          onChanged: (val) {
            setState(() {
              anwser20 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser20,
          onChanged: (val) {
            setState(() {
              anwser20 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser20,
          onChanged: (val) {
            setState(() {
              anwser20 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser20,
          onChanged: (val) {
            setState(() {
              anwser20 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz19({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser19,
          onChanged: (val) {
            setState(() {
              anwser19 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser19,
          onChanged: (val) {
            setState(() {
              anwser19 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser19,
          onChanged: (val) {
            setState(() {
              anwser19 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser19,
          onChanged: (val) {
            setState(() {
              anwser19 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz18({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser18,
          onChanged: (val) {
            setState(() {
              anwser18 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser18,
          onChanged: (val) {
            setState(() {
              anwser18 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser18,
          onChanged: (val) {
            setState(() {
              anwser18 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser18,
          onChanged: (val) {
            setState(() {
              anwser18 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz17({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser17,
          onChanged: (val) {
            setState(() {
              anwser17 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser17,
          onChanged: (val) {
            setState(() {
              anwser17 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser17,
          onChanged: (val) {
            setState(() {
              anwser17 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser17,
          onChanged: (val) {
            setState(() {
              anwser17 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz16({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser16,
          onChanged: (val) {
            setState(() {
              anwser16 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser16,
          onChanged: (val) {
            setState(() {
              anwser16 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser16,
          onChanged: (val) {
            setState(() {
              anwser16 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser16,
          onChanged: (val) {
            setState(() {
              anwser16 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz15({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser15,
          onChanged: (val) {
            setState(() {
              anwser15 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser15,
          onChanged: (val) {
            setState(() {
              anwser15 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser15,
          onChanged: (val) {
            setState(() {
              anwser15 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser15,
          onChanged: (val) {
            setState(() {
              anwser15 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz14({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser14,
          onChanged: (val) {
            setState(() {
              anwser14 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser14,
          onChanged: (val) {
            setState(() {
              anwser14 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser14,
          onChanged: (val) {
            setState(() {
              anwser14 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser14,
          onChanged: (val) {
            setState(() {
              anwser14 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz13({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser13,
          onChanged: (val) {
            setState(() {
              anwser13 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser13,
          onChanged: (val) {
            setState(() {
              anwser13 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser13,
          onChanged: (val) {
            setState(() {
              anwser13 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser13,
          onChanged: (val) {
            setState(() {
              anwser13 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz12({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser12,
          onChanged: (val) {
            setState(() {
              anwser12 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser12,
          onChanged: (val) {
            setState(() {
              anwser12 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser12,
          onChanged: (val) {
            setState(() {
              anwser12 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser12,
          onChanged: (val) {
            setState(() {
              anwser12 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz11({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser11,
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser11,
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser11,
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser11,
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz10({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser10,
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser10,
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser10,
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser10,
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz9({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser9,
          onChanged: (val) {
            setState(() {
              anwser9 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser9,
          onChanged: (val) {
            setState(() {
              anwser9 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser9,
          onChanged: (val) {
            setState(() {
              anwser9 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser9,
          onChanged: (val) {
            setState(() {
              anwser9 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz8({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser8,
          onChanged: (val) {
            setState(() {
              anwser8 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser8,
          onChanged: (val) {
            setState(() {
              anwser8 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser8,
          onChanged: (val) {
            setState(() {
              anwser8 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser8,
          onChanged: (val) {
            setState(() {
              anwser8 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz7({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser7,
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser7,
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser7,
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser7,
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz6({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser6,
          onChanged: (val) {
            setState(() {
              anwser6 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser6,
          onChanged: (val) {
            setState(() {
              anwser6 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser6,
          onChanged: (val) {
            setState(() {
              anwser6 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser6,
          onChanged: (val) {
            setState(() {
              anwser6 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz5({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser5,
          onChanged: (val) {
            setState(() {
              anwser5 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser5,
          onChanged: (val) {
            setState(() {
              anwser5 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser5,
          onChanged: (val) {
            setState(() {
              anwser5 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser5,
          onChanged: (val) {
            setState(() {
              anwser5 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz4({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser4,
          onChanged: (val) {
            setState(() {
              anwser4 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser4,
          onChanged: (val) {
            setState(() {
              anwser4 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser4,
          onChanged: (val) {
            setState(() {
              anwser4 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser4,
          onChanged: (val) {
            setState(() {
              anwser4 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz3({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser3,
          onChanged: (val) {
            setState(() {
              anwser3 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser3,
          onChanged: (val) {
            setState(() {
              anwser3 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser3,
          onChanged: (val) {
            setState(() {
              anwser3 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser3,
          onChanged: (val) {
            setState(() {
              anwser3 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz2({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser2,
          onChanged: (val) {
            setState(() {
              anwser2 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser2,
          onChanged: (val) {
            setState(() {
              anwser2 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser2,
          onChanged: (val) {
            setState(() {
              anwser2 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser2,
          onChanged: (val) {
            setState(() {
              anwser2 = val!;
            });
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz1({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วยอย่างยิ่ง',
          groupValue: anwser1,
          onChanged: (val) {
            setState(() {
              anwser1 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'ไม่เห็นด้วย',
          groupValue: anwser1,
          onChanged: (val) {
            setState(() {
              anwser1 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วย',
          groupValue: anwser1,
          onChanged: (val) {
            setState(() {
              anwser1 = val!;
            });
          },
        ),
        MainRadioButton(
          title: 'เห็นด้วยอย่างยิ่ง',
          groupValue: anwser1,
          onChanged: (val) {
            setState(() {
              anwser1 = val!;
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
            text:
                ' แบบวัดนี้เป็นแบบสอบถามเกี่ยวกับความรู้สึกนึกคิดของท่านที่มีต่อการดื่มเครื่องดื่มแอลกอฮอล์ กรุณาตัดสินใจว่าท่านเห็นด้วยหรือไม่เห็นด้วยมากน้อยแค่ไหนกับข้อความข้างล่างนี้ โดยการทำเครื่องหมาย  ✔ลงในช่องที่ตรงกับความรู้สึกของท่านตามความเป็นจริงให้มากที่สุด',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
