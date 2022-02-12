import 'package:cmu_mobile_app/src/pages/add_admin/register/register_admin_page2.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class RegisterAdminPage extends StatefulWidget {
  const RegisterAdminPage({Key? key}) : super(key: key);

  @override
  _RegisterAdminPageState createState() => _RegisterAdminPageState();
}

class _RegisterAdminPageState extends State<RegisterAdminPage> {
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterAdminPage2(),
                          ),
                        );
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
}
