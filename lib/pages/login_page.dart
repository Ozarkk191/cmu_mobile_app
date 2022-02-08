import 'package:cmu_mobile_app/pages/home/home_page.dart';
import 'package:cmu_mobile_app/pages/register_page.dart';
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
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _check() {
    // if (_username.text != "" && _password.text != "") {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(
          initPage: 0,
        ),
      ),
    );
    // }
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
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
                  title: 'ชื่อผู้ใช้ (Username)',
                  prefix: Icons.person,
                  controller: _username,
                ),
                _textfield(
                  context: context,
                  title: 'รหัสผ่าน (Password)',
                  prefix: Icons.lock,
                  suffix: Icons.remove_red_eye,
                  controller: _password,
                  obscureText: true,
                ),
                SizedBox(width: _size.width, child: const Text('ลืมรหัสผ่าน')),
                const SizedBox(
                  height: 50,
                ),
                MainButton(
                  ontab: _check,
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
