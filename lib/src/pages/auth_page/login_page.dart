import 'dart:convert';

import 'package:cmu_mobile_app/api/auth_api.dart';
import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:cmu_mobile_app/models/user_auth_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/auth_page/register_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box2.dart';
import 'package:cmu_mobile_app/src/widgets/textfields/main_textfield.dart';
import 'package:flutter/material.dart';

import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loading = false;

  void _check({required String email, required String password}) {
    setState(() {
      loading = true;
    });
    if (_username.text == "" || _password.text == "") {
      setState(() {
        loading = false;
      });
    } else if (_password.text.length < 6) {
      setState(() {
        loading = false;
      });
    } else {
      String e = "$email@nurse.com";
      e = e.replaceAll(" ", "");
      login(email: e.trim(), password: password.trim());
    }
  }

  void login({required String email, required String password}) async {
    LoginParameter body = LoginParameter(
      email: email,
      password: password,
    );
    Map<String, dynamic> data = await AuthApi.signIn(param: body);
    if (data.toString() == "{message: Bad credentials}") {
      _showDialog();
    } else {
      UserAuthModel user = UserAuthModel.fromJson(data);
      await SharedPref.setStringPref(
        key: "user",
        value: jsonEncode(user.toJson()),
      );
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(
            initPage: 0,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    // _username.text = "aum@aum.com";
    // _password.text = "123456";
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  void _showDialog() {
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    // padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 4,
                        color: const Color(0xffFF6600),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        size: 50,
                        color: Color(0xffFF6600),
                      ),
                    ),
                  ),
                  const Text(
                    " ชื่อผู้ใช้งานหรือพาสเวิร์ดไม่ถูกต้อง",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffFF6600),
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MainButton(
                        ontab: () {
                          Navigator.pop(context);
                        },
                        title: "ตกลง",
                        fontSize: 10,
                        height: 30,
                        width: 80,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: LoadingBox2(
          loading: loading,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: _size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 80, 0, 40),
                    width: _size.width * 0.3,
                    height: _size.width * 0.3,
                    child: Image.asset(
                      "assets/images/app_icon.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  _textfield(
                    context: context,
                    title: 'ชื่อผู้ใช้ (ระบุเป็นภาษาอังกฤษหรือตัวเลข)',
                    prefix: Icons.person,
                    controller: _username,
                  ),
                  _textfield(
                    context: context,
                    title: 'รหัสผ่าน (ระบุเป็นตัวอักษรหรือตัวเลข 4 ตัวขึ้นไป)',
                    prefix: Icons.lock,
                    suffix: Icons.remove_red_eye,
                    controller: _password,
                    obscureText: true,
                  ),
                  SizedBox(
                      width: _size.width, child: const Text('ลืมรหัสผ่าน')),
                  const SizedBox(
                    height: 50,
                  ),
                  MainButton(
                    ontab: () =>
                        _check(email: _username.text, password: _password.text),
                    width: _size.width * 0.6,
                    title: 'เข้าสู่ระบบ',
                    borderRadius: 50,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text('สมัครสมาชิก')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _textfield({
    required BuildContext context,
    required String title,
    TextEditingController? controller,
    IconData? prefix,
    IconData? suffix,
    bool obscureText = false,
  }) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        MainTextField(
          obscureText: obscureText,
          controller: controller,
          prefixIcon: Icon(prefix),
          suffixIcon: Icon(suffix),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
