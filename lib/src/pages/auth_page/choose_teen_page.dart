import 'dart:async';
import 'dart:convert';

import 'package:cmu_mobile_app/api/auth_api.dart';
import 'package:cmu_mobile_app/models/sign_up_model.dart';
import 'package:cmu_mobile_app/models/user_auth_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class ChooseTeenPage extends StatefulWidget {
  final SignUpModel signUp;
  const ChooseTeenPage({Key? key, required this.signUp}) : super(key: key);

  @override
  _ChooseTeenPageState createState() => _ChooseTeenPageState();
}

class _ChooseTeenPageState extends State<ChooseTeenPage> {
  late int atIndex = 100000;
  late SignUpModel signUp;
  Future<List<UserAuthModel>> getStudents() async {
    List<UserAuthModel> studentList = <UserAuthModel>[];
    studentList = await AuthApi.getStudents();

    return studentList;
  }

  @override
  void initState() {
    signUp = widget.signUp;
    super.initState();
  }

  void signUpFunc() async {
    final user = await AuthApi.signUp(param: signUp);
    await SharedPref.setStringPref(
      key: "user",
      value: jsonEncode(user.toJson()),
    );
    _showDialog(context);
  }

  void _showDialog(context) {
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

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: FutureBuilder(
          future: getStudents(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<UserAuthModel> list = snapshot.data;
              return SizedBox(
                width: _size.width,
                height: _size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'กรุณาเลือกนักเรียนในการปกครอง',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
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
                                      signUp.studentId = index.toString();
                                    });
                                  },
                                  child: Icon(
                                    signUp.studentId == index.toString()
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
                    ),
                    const SizedBox(height: 20),
                    MainButton(
                      ontab: signUpFunc,
                      title: "ถัดไป",
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
