import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/auth_api.dart';
import 'package:cmu_mobile_app/models/sign_up_model.dart';
import 'package:cmu_mobile_app/models/user_auth_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_radio_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repassword = TextEditingController();
  List<UserAuthModel> studentList = <UserAuthModel>[];
  List<String> studentItemList = [];
  String check = "";

  String role = "รพสต";
  String studentId = "";
  bool checkRole = false;

  void _check() {
    if (_username.text == "" &&
        _password.text == "" &&
        _repassword.text == "") {
      log("field is empty");
    } else if (_password.text != _repassword.text) {
      log("password not same");
    } else if (_password.text.length < 6) {
      log("password length < 6");
    } else {
      signUp();
    }
  }

  String changeRole(String role) {
    switch (role) {
      case "วัยรุ่น":
        return "student";
      case "ผู้ปกครอง":
        return "parent";
      case "อาจารย์":
        return "teacher";
      case "พระสงฆ์":
        return "monk";
      case "รพสต":
        return "hospital";

      default:
        return "";
    }
  }

  void signUp() async {
    SignUpModel param = SignUpModel(
      email: "${_username.text}@nurse.com",
      name: _username.text,
      password: _password.text,
      passwordConfirmation: _repassword.text,
      role: changeRole(role),
      studentId: studentId,
      branchId: 1,
    );

    final user = await AuthApi.signUp(param: param);
    log(user.toJson().toString());
    await SharedPref.setStringPref(
      key: "user",
      value: jsonEncode(user.toJson()),
    );
    _showDialog();
  }

  void _showDialog() {
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
                children: const [
                  Icon(
                    Icons.check,
                    size: 50,
                    color: Color(0xffFF6600),
                  ),
                  Text(
                    'เรียบร้อย',
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(
            initPage: 0,
          ),
        ),
      );
    });
  }

  Future<List<UserAuthModel>> getStudents() async {
    List<UserAuthModel> studentList = <UserAuthModel>[];
    studentList = await AuthApi.getStudents();

    return studentList;
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _repassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getStudents(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                List<UserAuthModel> list = snapshot.data;
                return Container(
                  margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: _size.width,
                        margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                        child: const Center(
                          child: Text(
                            'สมัครสมาชิก',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      _field(
                        title: 'ชื่อ',
                        controller: _username,
                      ),
                      _field(
                        title: 'รหัสผ่าน',
                        controller: _password,
                        obscureText: true,
                      ),
                      _field(
                        title: 'ยืนยันรหัสผ่าน',
                        controller: _repassword,
                        obscureText: true,
                      ),
                      _field(title: 'บทบาท', titleOnly: true),
                      MainRadioButton(
                        title: "รพสต",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = false;
                            studentId = "";
                          });
                        },
                        groupValue: role,
                      ),
                      MainRadioButton(
                        title: "วัยรุ่น",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = false;
                            studentId = "";
                          });
                        },
                        groupValue: role,
                      ),
                      MainRadioButton(
                        title: "ผู้ปกครอง",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = true;
                          });
                        },
                        groupValue: role,
                      ),
                      MainRadioButton(
                        title: "อาจารย์",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = true;
                          });
                        },
                        groupValue: role,
                      ),
                      MainRadioButton(
                        title: "พระสงฆ์",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = true;
                          });
                        },
                        groupValue: role,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: checkRole,
                        child: teensWidget(_size, list),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainButton(
                        width: _size.width * 0.5,
                        ontab: () {
                          _check();
                        },
                        borderRadius: 50,
                        title: 'สมัคร',
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  width: _size.width,
                  height: _size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  SizedBox _field({
    required String title,
    TextEditingController? controller,
    bool titleOnly = false,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Text(title + " : ", style: const TextStyle(fontSize: 12)),
          ),
          Expanded(
            flex: 3,
            child: Visibility(
              visible: !titleOnly,
              child: TextField(
                keyboardType: keyboardType,
                obscureText: obscureText,
                controller: controller,
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox teensWidget(Size _size, List<UserAuthModel> list) {
    return SizedBox(
      width: _size.width,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'กรุณาเลือกนักเรียนในการปกครอง',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                width: _size.width,
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          check = index.toString();
                          studentId = list[index].id.toString();
                        });
                      },
                      child: Icon(
                        check == index.toString()
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(list[index].name.toString()),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
