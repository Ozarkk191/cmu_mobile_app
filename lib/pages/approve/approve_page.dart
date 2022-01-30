import 'dart:async';
import 'package:cmu_mobile_app/models/user_model.dart';
import 'package:cmu_mobile_app/pages/home_page.dart';
import 'package:cmu_mobile_app/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/widgets/avatar/custom_avatar.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class ApprovePage extends StatelessWidget {
  final UserModel user;
  const ApprovePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(initPage: 0),
          ),
        );
      });
    }

    return Scaffold(
      body: MainLayout(
        child: Column(
          children: [
            CustomAppbar(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'ยืนยันคำขอ',
            ),
            const CustomAvatar(
              path: 'assets/images/ic_user.png',
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              "${user.namePrefix} ${user.firstname} ${user.lastname}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            const Text(
              "ได้สมัคเข้าร่วม cmu.app",
            ),
            const SizedBox(height: 40),
            const Text(
              "สมัคผ่าน GOOGLE ด้วย.......@gmail.com",
            ),
            const SizedBox(height: 40),
            Text(
              "กลุ่ม ${user.group}",
              style: const TextStyle(fontSize: 16),
            ),
            Expanded(
              child: Container(),
            ),
            MainButton(
              ontab: () {
                _showDialog();
              },
              title: 'อนุมัติ',
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
