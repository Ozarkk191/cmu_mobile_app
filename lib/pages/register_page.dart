import 'dart:async';

import 'package:cmu_mobile_app/pages/quiz_and_assessment/quiz/question_page.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _listHorizontal = [
    "รพสต.",
    "วัยรุ่น",
    "ผู้ปกครอง",
    "อาจารย์",
    "พระสงฆ์"
  ];
  var _indexHorizontal = 0;

  void _showDialog(int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ), //this right here
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
                children: [
                  const Icon(
                    Icons.check,
                    size: 50,
                    color: Color(0xffFF6600),
                  ),
                  const Text(
                    'เรียบร้อย',
                    style: TextStyle(
                      color: Color(0xffFF6600),
                      fontSize: 24,
                    ),
                  ),
                  Visibility(
                    visible: _listHorizontal[index] == "วัยรุ่น" ? true : false,
                    child: const Text(
                      'รหัสสมาชิก = 1',
                      style: TextStyle(
                        color: Color(0xffFF6600),
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QusetionPage(
            groupName: _listHorizontal[index],
            quizType: 'ความรู้เกี่ยวกับพัฒนาการของวัยรุ่น',
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: const Center(
                    child: Text(
                      'สมัครสมาชิก',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                _field(title: 'ชื่อเข้าใช้งาน', controller: _username),
                _field(title: 'รหัสผ่าน', controller: _password),
                _field(title: 'บทบาท', titleOnly: true),
                FlutterRadioGroup(
                  titles: _listHorizontal,
                  labelStyle: const TextStyle(color: Colors.white38),
                  labelVisible: false,
                  label: "This is label radio",
                  activeColor: const Color(0xffFF6600),
                  titleStyle: const TextStyle(fontSize: 14),
                  defaultSelected: _indexHorizontal,
                  orientation: RGOrientation.VERTICAL,
                  onChanged: (index) {
                    setState(() {
                      _indexHorizontal = index!;
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                MainButton(
                  ontab: () {
                    _showDialog(_indexHorizontal);
                  },
                  borderRadius: 50,
                  title: 'สมัคร',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _field(
      {required String title,
      TextEditingController? controller,
      bool titleOnly = false}) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Text(title),
          ),
          Expanded(
            flex: 3,
            child: Visibility(
              visible: !titleOnly,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
