import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  final String role;
  final int endPage;
  const PersonalPage({
    Key? key,
    required this.controller,
    required this.nextPage,
    required this.role,
    this.endPage = 1000,
  }) : super(key: key);

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
          height: _size.height,
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
                            'กรุณากรอกข้อความ หรือเลือกข้อความที่ตรงกับความเป็นจริงของท่าน',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                widget.role == "วัยรุ่น"
                    ? teenRole(_size)
                    : widget.role == "ผู้ปกครอง"
                        ? parentRole(_size)
                        : widget.role == "ครู"
                            ? parentRole(_size)
                            : monkRole(_size),
                const SizedBox(height: 40),
                Center(
                  child: MainButton(
                    width: _size.width * 0.5,
                    borderRadius: 50,
                    ontab: () {
                      if (widget.endPage == widget.nextPage) {
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

  Widget teenRole(Size _size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        quiz1(number: 1),
        quiz2(_size, number: 2),
        quiz3(number: 3),
        quiz4(number: 4),
        quiz5(number: 5),
        quiz6(number: 6),
        quiz7(number: 7),
        quiz8(_size, number: 8),
        quiz9(_size, number: 9),
        quiz10(number: 10),
        quiz11(number: 11),
        quiz12(number: 12),
        quiz13(_size, number: 13),
      ],
    );
  }

  Widget parentRole(Size _size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        quiz1(number: 1),
        quiz2(_size, number: 2),
        quiz3(number: 3),
        quiz14(number: 4),
        quiz9(_size, number: 5),
      ],
    );
  }

  Widget monkRole(Size _size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        quiz1(number: 1),
        quiz2(_size, number: 2),
        quiz14(number: 3),
        quiz15(_size, number: 4),
      ],
    );
  }

  Widget quiz15(Size _size, {required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$number.	ท่านบวชมาแล้ว',
              style: const TextStyle(fontSize: 12),
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
              'พรรษา',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz14({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.	ระดับการศึกษาของท่านคือ',
          style: const TextStyle(fontSize: 12),
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

  Column quiz13(Size _size, {required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. เพื่อนของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่',
          style: const TextStyle(fontSize: 12),
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

  Column quiz12({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. สมาชิกในครอบครัวของท่านดื่มเครื่องดื่มแอลกอฮอล์หรือไม่',
          style: const TextStyle(fontSize: 12),
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
                  Expanded(
                    flex: 1,
                    child: _checkBox(
                      title: 'พ่อ',
                      value: drinkAnwser1,
                      onChanged: (val) {
                        setState(() {
                          drinkAnwser1 = !drinkAnwser1;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _checkBox(
                      title: 'แม่',
                      value: drinkAnwser2,
                      onChanged: (val) {
                        setState(() {
                          drinkAnwser2 = !drinkAnwser2;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _checkBox(
                      title: 'พ่อและแม่',
                      value: drinkAnwser3,
                      onChanged: (val) {
                        setState(() {
                          drinkAnwser3 = !drinkAnwser3;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _checkBox(
                      title: 'พี่/น้อง',
                      value: drinkAnwser4,
                      onChanged: (val) {
                        setState(() {
                          drinkAnwser4 = !drinkAnwser4;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _checkBox(
                      title: 'ปู่/ย่า/ตา/ยาย',
                      value: drinkAnwser5,
                      onChanged: (val) {
                        setState(() {
                          drinkAnwser5 = !drinkAnwser5;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _checkBox(
                      title: 'ลุง/ป้า/น้า/อา',
                      value: drinkAnwser6,
                      onChanged: (val) {
                        setState(() {
                          drinkAnwser6 = !drinkAnwser6;
                        });
                      },
                    ),
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
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }

  Column quiz11({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. รายได้ของครอบครัวต่อเดือน',
          style: const TextStyle(fontSize: 12),
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

  Column quiz9(Size _size, {required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.	รายได้ที่ได้รับในแต่ละเดือน (ไม่รวมค่าเล่าเรียน  ค่าอุปกรณ์ในการเรียน  ค่าหอพัก)',
          style: const TextStyle(fontSize: 12),
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

  Column quiz10({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. ผู้ปกครองของท่านประกอบอาชีพ',
          style: const TextStyle(fontSize: 12),
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

  Column quiz8(Size _size, {required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$number. จำนวนสมาชิกในครอบครัว',
              style: const TextStyle(fontSize: 12),
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

  Column quiz7({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. บุคคลที่อาศัยอยู่ด้วยในระหว่างที่เรียน คือ',
          style: const TextStyle(fontSize: 12),
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

  Column quiz6({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. ผลการเรียนปัจจุบันของท่านเมื่อเปรียบเทียบกับผลการเรียนในเทอมที่ผ่านมา',
          style: const TextStyle(fontSize: 12),
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

  Widget quiz5({required int number}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$number. ผลการเรียน\nในเทอมที่ผ่านมา ท่านได้เกรดเฉลี่ย',
              style: const TextStyle(fontSize: 12),
            ),
            const Expanded(
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
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column quiz4({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.	ท่านกำลังศึกษาอยู่ในระดับชั้น',
          style: const TextStyle(fontSize: 12),
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

  Column quiz3({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.	ท่านนับถือศาสนา',
          style: const TextStyle(fontSize: 12),
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

  Column quiz2(Size _size, {required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$number.	ปัจจุบันท่านอายุ',
              style: const TextStyle(fontSize: 12),
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

  Column quiz1({required int number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.	เพศ',
          style: const TextStyle(fontSize: 12),
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
