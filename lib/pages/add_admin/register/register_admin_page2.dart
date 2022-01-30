import 'dart:async';
import 'package:cmu_mobile_app/pages/home_page.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/widgets/textfields/main_textfield.dart';
import 'package:flutter/material.dart';

class RegisterAdminPage2 extends StatefulWidget {
  const RegisterAdminPage2({Key? key}) : super(key: key);

  @override
  _RegisterAdminPage2State createState() => _RegisterAdminPage2State();
}

class _RegisterAdminPage2State extends State<RegisterAdminPage2> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 200,
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
                      fontSize: 30,
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
      // Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(initPage: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 40),
                child: const Center(
                  child: Text(
                    'สมัครสมาชิก',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _textfield(
                      context: context,
                      title: 'ชื่อ / อีเมล',
                      prefix: Icons.person,
                    ),
                    _textfield(
                      context: context,
                      title: 'รหัส',
                      prefix: Icons.lock,
                      suffix: Icons.remove_red_eye,
                    ),
                    _textfield(
                      context: context,
                      title: 'ยืนยันรหัส',
                      prefix: Icons.lock,
                      suffix: Icons.remove_red_eye,
                    ),
                    const SizedBox(height: 60),
                    MainButton(
                      ontab: () {
                        _showDialog();
                      },
                      borderRadius: 50,
                      width: 200,
                      title: 'ยืนยัน',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _textfield(
      {required BuildContext context,
      required String title,
      IconData? prefix,
      IconData? suffix}) {
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
