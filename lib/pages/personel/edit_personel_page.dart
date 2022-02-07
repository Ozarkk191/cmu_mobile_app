import 'dart:async';

import 'package:cmu_mobile_app/pages/home/home_page.dart';
import 'package:cmu_mobile_app/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/widgets/avatar/custom_avatar.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class EditPersonnelPage extends StatefulWidget {
  const EditPersonnelPage({Key? key}) : super(key: key);

  @override
  _EditPersonnelPageState createState() => _EditPersonnelPageState();
}

class _EditPersonnelPageState extends State<EditPersonnelPage> {
  void _showDialog() {
    showDialog(
      context: context,
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
          builder: (context) => const HomePage(initPage: 3),
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
              CustomAppbar(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'แก้ไขข้อมูลส่วนตัว',
              ),
              const CustomAvatar(
                path: 'assets/images/ic_user.png',
                size: 80,
              ),
              const Text(
                'แอดมิน หวาน',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text('ชื่อ'),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            ),
                          ),
                        ),
                        Text('สกุล'),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text('เพศ  หญิง / ชาย  อายุ'),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text('อีเมล'),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text('โทรศัพท์'),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text('ที่อยู่'),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.teal,
                        ),
                      ),
                      child: const TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'เพิ่มที่อยู่',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (val) {}),
                        const Text('ยินยอมรับข้อตกลง'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MainButton(
                      ontab: () {
                        _showDialog();
                      },
                      borderRadius: 50,
                      width: 200,
                      title: 'ยืนยัน',
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
