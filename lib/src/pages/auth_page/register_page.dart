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
  bool loading = true;

  String role = "วัยรุ่น";
  int studentId = 0;
  bool checkRole = false;

  String dropdownvalue = 'เลือกนักเรียนในการปกครองของท่าน';

  List<UserAuthModel> list = [];

  void _check() {
    setState(() {
      loading = true;
    });
    if (_username.text == "" &&
        _password.text == "" &&
        _repassword.text == "") {
      log("field is empty");
      setState(() {
        loading = false;
      });
    } else if (_password.text != _repassword.text) {
      log("password not same");
      setState(() {
        loading = false;
      });
    } else if (_password.text.length < 6) {
      log("password length < 6");
      setState(() {
        loading = false;
      });
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
      case "ครู":
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
    if (checkRole) {
      if (studentId == 0) {
        _showDialog(
          title: "กรุณาเลือกนักเรียนของท่าน",
          callback: () {
            Navigator.pop(context);
          },
        );
      } else {
        save();
      }
    } else {
      save();
    }
  }

  void save() async {
    String email = _username.text.replaceAll(" ", "");
    SignUpModel param = SignUpModel(
      email: "${email.trim()}@nurse.com",
      name: _username.text,
      password: _password.text,
      passwordConfirmation: _repassword.text,
      role: changeRole(role),
      studentId: studentId,
      branchId: 1,
    );
    // log

    final user = await AuthApi.signUp(param: param);
    await SharedPref.setStringPref(
      key: "user",
      value: jsonEncode(user.toJson()),
    );

    _showDialog(
      title: "เรียบร้อย",
      callback: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(
              initPage: 0,
            ),
          ),
        );
      },
    );
  }

  void _showDialog({required Function() callback, required String title}) {
    setState(() {
      loading = false;
    });
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
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
    Timer(const Duration(seconds: 3), callback);
  }

  void getStudents() async {
    list = await AuthApi.getStudents();
    final init = UserAuthModel(id: 0, name: "เลือกนักเรียนในการปกครองของท่าน");
    list.insert(0, init);
    log(list[0].name!);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getStudents();
    super.initState();
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
          child: loading
              ? SizedBox(
                  width: _size.width,
                  height: _size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
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
                        hintText: 'ระบุเป็นภาษาอังกฤษหรือตัวเลข',
                      ),
                      _field(
                        title: 'รหัสผ่าน',
                        hintText: 'ระบุเป็นตัวอักษรหรือตัวเลข 4 ตัวขึ้นไป',
                        controller: _password,
                        obscureText: true,
                      ),
                      _field(
                        title: 'ยืนยันรหัสผ่าน',
                        hintText: 'ระบุเป็นตัวอักษรหรือตัวเลข 4 ตัวขึ้นไป',
                        controller: _repassword,
                        obscureText: true,
                      ),
                      _field(title: 'บทบาท', titleOnly: true),
                      MainRadioButton(
                        title: "วัยรุ่น",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = false;
                            studentId = 0;
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
                        title: "ครู",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = false;
                            studentId = 0;
                          });
                        },
                        groupValue: role,
                      ),
                      MainRadioButton(
                        title: "พระสงฆ์",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = false;
                            studentId = 0;
                          });
                        },
                        groupValue: role,
                      ),
                      MainRadioButton(
                        title: "รพสต",
                        onChanged: (val) {
                          setState(() {
                            role = val!;
                            checkRole = false;
                            studentId = 0;
                          });
                        },
                        groupValue: role,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: checkRole,
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: list.map((var items) {
                            return DropdownMenuItem(
                              value: items.name,
                              child: Text(
                                items.name!,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                              final selecte = list
                                  .where((element) =>
                                      element.name!.contains(dropdownvalue))
                                  .toList();

                              studentId = selecte[0].id!;
                            });
                          },
                        ),
                        // teensWidget(_size, list),
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
    String hintText = "",
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Text(title + " : ", style: const TextStyle(fontSize: 10)),
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
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 8, color: Colors.grey),
                  contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
