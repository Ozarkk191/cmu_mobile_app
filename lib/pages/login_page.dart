import 'package:cmu_mobile_app/pages/quiz_and_assessment/cover_page.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/widgets/textfields/main_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: _size.width,
          height: _size.height,
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
                title: 'ชื่อ / อีเมล',
                prefix: Icons.person,
              ),
              _textfield(
                context: context,
                title: 'รหัสผ่าน',
                prefix: Icons.lock,
                suffix: Icons.remove_red_eye,
              ),
              SizedBox(width: _size.width, child: const Text('ลืมรหัสผ่าน')),
              const SizedBox(
                height: 50,
              ),
              MainButton(
                ontab: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CoverPage(),
                    ),
                  );
                },
                width: _size.width * 0.6,
                title: 'เข้าสู่ระบบ',
                borderRadius: 50,
              ),
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
