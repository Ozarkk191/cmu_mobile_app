import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  const PersonalPage(
      {Key? key, required this.controller, required this.nextPage})
      : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  String anwser1 = "";
  String anwser3 = "";
  String anwser4 = "";
  String anwser6 = "";
  String anwser7 = "";
  String anwser10 = "";
  String anwser11 = "";
  String anwser12 = "";
  String anwser13 = "";

  bool drinkAnwser1 = false;
  bool drinkAnwser2 = false;
  bool drinkAnwser3 = false;
  bool drinkAnwser4 = false;
  bool drinkAnwser5 = false;
  bool drinkAnwser6 = false;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xfffbd4b9),
          width: _size.width,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'ส่วนที่ 1   แบบสอบถามข้อมูลส่วนบุคคล',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                RichText(
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
                            'กรุณากรอกข้อความ หรือทำเครื่องหมาย √ หน้าข้อความที่ตรงกับความเป็นจริงของท่าน',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                quiz1(),
                quiz2(_size),
                quiz3(),
                quiz4(),
                quiz5(),
                const SizedBox(height: 20),
                quiz6(),
                quiz7(),
                quiz8(_size),
                quiz9(_size),
                quiz10(),
                quiz11(),
                quiz12(),
                quiz13(_size),
                const SizedBox(height: 40),
                Center(
                  child: MainButton(
                    width: _size.width * 0.5,
                    borderRadius: 50,
                    ontab: () {
                      widget.controller.jumpToPage(widget.nextPage);
                    },
                    title: 'ถัดไป',
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column quiz13(Size _size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '13. เพื่อนของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'ไม่ดื่ม',
          onChanged: (val) {
            setState(() {
              anwser13 = val!;
            });
          },
          groupValue: anwser13,
        ),
        _radioButton(
          title: 'ดื่ม ระบุ',
          textField: true,
          suffix: 'คน',
          onChanged: (val) {
            setState(() {
              anwser13 = val!;
            });
          },
          groupValue: anwser13,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column quiz12() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '12. สมาชิกในครอบครัวของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'ไม่ดื่ม',
          onChanged: (val) {
            setState(() {
              anwser12 = val!;
              if (anwser12 == "ไม่ดื่ม") {
                drinkAnwser1 = false;
                drinkAnwser2 = false;
                drinkAnwser3 = false;
                drinkAnwser4 = false;
                drinkAnwser5 = false;
                drinkAnwser6 = false;
              }
            });
          },
          groupValue: anwser12,
        ),
        _radioButton(
          title: 'ดื่ม ระบุ',
          onChanged: (val) {
            setState(() {
              anwser12 = val!;
            });
          },
          groupValue: anwser12,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  _checkBox(
                    title: 'พ่อ',
                    value: drinkAnwser1,
                    onChanged: (val) {
                      setState(() {
                        drinkAnwser1 = !drinkAnwser1;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  _checkBox(
                    title: 'แม่',
                    value: drinkAnwser2,
                    onChanged: (val) {
                      setState(() {
                        drinkAnwser2 = !drinkAnwser2;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  _checkBox(
                    title: 'พ่อและแม่',
                    value: drinkAnwser3,
                    onChanged: (val) {
                      setState(() {
                        drinkAnwser3 = !drinkAnwser3;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  _checkBox(
                    title: 'พี่/น้อง',
                    value: drinkAnwser4,
                    onChanged: (val) {
                      setState(() {
                        drinkAnwser4 = !drinkAnwser4;
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  _checkBox(
                    title: 'ปู่/ย่า/ตา/ยาย',
                    value: drinkAnwser5,
                    onChanged: (val) {
                      setState(() {
                        drinkAnwser5 = !drinkAnwser5;
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  _checkBox(
                    title: 'ลุง/ป้า/น้า/อา',
                    value: drinkAnwser6,
                    onChanged: (val) {
                      setState(() {
                        drinkAnwser6 = !drinkAnwser6;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Row _checkBox(
      {required String title,
      required Function(bool?) onChanged,
      required bool value}) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: anwser12 == "ดื่ม ระบุ" ? onChanged : null,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  Column quiz11() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '11. รายได้ของครอบครัวต่อเดือน',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'น้อยกว่า 5,000 บาท',
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
          groupValue: anwser11,
        ),
        _radioButton(
          title: '5,000 - 10,000 บาท',
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
          groupValue: anwser11,
        ),
        _radioButton(
          title: '10,001 - 15,000 บาท',
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
          groupValue: anwser11,
        ),
        _radioButton(
          title: '15,001 - 20,000 บาท',
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
          groupValue: anwser11,
        ),
        _radioButton(
          title: '20,001 - 25,000 บาท',
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
          groupValue: anwser11,
        ),
        _radioButton(
          title: '25,001 - 30,000 บาท',
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
          groupValue: anwser11,
        ),
        _radioButton(
          title: 'มากกว่า 30,000 บาท',
          onChanged: (val) {
            setState(() {
              anwser11 = val!;
            });
          },
          groupValue: anwser11,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column quiz9(Size _size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '9.	รายได้ที่ได้รับในแต่ละเดือน (ไม่รวมค่าเล่าเรียน  ค่าอุปกรณ์ในการเรียน  ค่าหอพัก)',
          style: TextStyle(fontSize: 12),
        ),
        Row(
          children: [
            SizedBox(
              width: _size.width * 0.2,
              child: const TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 5),
                ),
              ),
            ),
            const Text(
              'บาท/เดือน หรือ',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              width: _size.width * 0.2,
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 5),
                ),
              ),
            ),
            const Text(
              'บาท/สัปดาห์',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: _size.width * 0.2,
              child: const TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 5),
                ),
              ),
            ),
            const Text(
              'บาท/วัน',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column quiz10() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '10. ผู้ปกครองของท่านประกอบอาชีพ',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'เกษตรกร',
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
          groupValue: anwser10,
        ),
        _radioButton(
          title: 'รับจ้าง',
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
          groupValue: anwser10,
        ),
        _radioButton(
          title: 'ค้าขาย',
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
          groupValue: anwser10,
        ),
        _radioButton(
          title: 'รับราชการ/รัฐวิสาหกิจ',
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
          groupValue: anwser10,
        ),
        _radioButton(
          title: 'พนักงานบริษัท',
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
          groupValue: anwser10,
        ),
        _radioButton(
          title: 'ไม่ได้ประกอบอาชีพ',
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
          groupValue: anwser10,
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          textField: true,
          onChanged: (val) {
            setState(() {
              anwser10 = val!;
            });
          },
          groupValue: anwser10,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column quiz8(Size _size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              '8. จำนวนสมาชิกในครอบครัว',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              width: _size.width * 0.2,
              child: const TextField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 5),
                ),
              ),
            ),
            const Text(
              'คน',
              style: TextStyle(fontSize: 12),
            ),
          ],
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
          '7. บุคคลที่อาศัยอยู่ด้วยในระหว่างที่เรียน คือ',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'บิดาและมารดา',
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
          groupValue: anwser7,
        ),
        _radioButton(
          title: 'ญาติพี่น้อง',
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
          groupValue: anwser7,
        ),
        _radioButton(
          title: 'เช่าหอพักอยู่กับเพื่อน',
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
          groupValue: anwser7,
        ),
        _radioButton(
          title: 'วัด',
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
          groupValue: anwser7,
        ),
        _radioButton(
          title: 'อยู่บ้านคนเดียว',
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
          groupValue: anwser7,
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          textField: true,
          onChanged: (val) {
            setState(() {
              anwser7 = val!;
            });
          },
          groupValue: anwser7,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column quiz6() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '6. ผลการเรียนปัจจุบันของท่านเมื่อเปรียบเทียบกับผลการเรียนในเทอมที่ผ่านมา',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'ดีขึ้น',
          onChanged: (val) {
            setState(() {
              anwser6 = val!;
            });
          },
          groupValue: anwser6,
        ),
        _radioButton(
          title: 'เท่าเดิม',
          onChanged: (val) {
            setState(() {
              anwser6 = val!;
            });
          },
          groupValue: anwser6,
        ),
        _radioButton(
          title: 'แย่',
          onChanged: (val) {
            setState(() {
              anwser6 = val!;
            });
          },
          groupValue: anwser6,
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          textField: true,
          onChanged: (val) {
            setState(() {
              anwser6 = val!;
            });
          },
          groupValue: anwser6,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Row quiz5() {
    return Row(
      children: const [
        Text(
          '5. ผลการเรียนในเทอมที่ผ่านมา ท่านได้เกรดเฉลี่ย',
          style: TextStyle(fontSize: 12),
        ),
        Expanded(
          child: TextField(
            maxLength: 4,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 5),
            ),
          ),
        ),
      ],
    );
  }

  Column quiz4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '4.	ท่านกำลังศึกษาอยู่ในระดับชั้น',
          style: TextStyle(fontSize: 12),
        ),
        Row(
          children: [
            Expanded(
              child: _radioButton(
                title: 'ประถมศึกษาปีที่ 4',
                onChanged: (val) {
                  setState(() {
                    anwser4 = val!;
                  });
                },
                groupValue: anwser4,
              ),
            ),
            Expanded(
              child: _radioButton(
                title: 'มัธยมศึกษาปีที่ 1',
                onChanged: (val) {
                  setState(() {
                    anwser4 = val!;
                  });
                },
                groupValue: anwser4,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _radioButton(
                title: 'ประถมศึกษาปีที่ 5',
                onChanged: (val) {
                  setState(() {
                    anwser4 = val!;
                  });
                },
                groupValue: anwser4,
              ),
            ),
            Expanded(
              child: _radioButton(
                title: 'มัธยมศึกษาปีที่ 2',
                onChanged: (val) {
                  setState(() {
                    anwser4 = val!;
                  });
                },
                groupValue: anwser4,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _radioButton(
                title: 'ประถมศึกษาปีที่ 6',
                onChanged: (val) {
                  setState(() {
                    anwser4 = val!;
                  });
                },
                groupValue: anwser4,
              ),
            ),
            Expanded(
              child: _radioButton(
                title: 'มัธยมศึกษาปีที่ 3',
                onChanged: (val) {
                  setState(() {
                    anwser4 = val!;
                  });
                },
                groupValue: anwser4,
              ),
            ),
          ],
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          textField: true,
          onChanged: (val) {
            setState(() {
              anwser4 = val!;
            });
          },
          groupValue: anwser4,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column quiz3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3.	ท่านนับถือศาสนา',
          style: TextStyle(fontSize: 12),
        ),
        _radioButton(
          title: 'พุทธ',
          onChanged: (val) {
            setState(() {
              anwser3 = val!;
            });
          },
          groupValue: anwser3,
        ),
        _radioButton(
          title: 'ศริสต์',
          onChanged: (val) {
            setState(() {
              anwser3 = val!;
            });
          },
          groupValue: anwser3,
        ),
        _radioButton(
          title: 'อิสลาม',
          onChanged: (val) {
            setState(() {
              anwser3 = val!;
            });
          },
          groupValue: anwser3,
        ),
        _radioButton(
          title: 'อื่นๆ ระบุ',
          textField: true,
          onChanged: (val) {
            setState(() {
              anwser3 = val!;
            });
          },
          groupValue: anwser3,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column quiz2(Size _size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              '2.	ปัจจุบันท่านอายุ',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              width: _size.width * 0.2,
              child: const TextField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                ),
              ),
            ),
            const Text(
              'ปี',
              style: TextStyle(fontSize: 12),
            ),
          ],
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
          '1.	เพศ',
          style: TextStyle(fontSize: 12),
        ),
        Row(
          children: [
            Expanded(
              child: _radioButton(
                title: 'ชาย',
                onChanged: (val) {
                  setState(() {
                    anwser1 = val!;
                  });
                },
                groupValue: anwser1,
              ),
            ),
            Expanded(
              child: _radioButton(
                title: 'หญิง',
                onChanged: (val) {
                  setState(() {
                    anwser1 = val!;
                  });
                },
                groupValue: anwser1,
              ),
            ),
          ],
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
