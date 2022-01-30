import 'package:cmu_mobile_app/models/user_model.dart';
import 'package:cmu_mobile_app/pages/add_admin/register/register_admin_page.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/widgets/line/line.dart';
import 'package:flutter/material.dart';

class AdminListPage extends StatefulWidget {
  const AdminListPage({Key? key}) : super(key: key);

  @override
  _AdminListPageState createState() => _AdminListPageState();
}

class _AdminListPageState extends State<AdminListPage> {
  late List<UserModel> userList = [
    UserModel(firstname: "หมูหวาน", lastname: "", role: "ผู้ดูแล"),
    UserModel(firstname: "ใจดี", lastname: "ดีดีดี", role: "ผู้ดูแล"),
    UserModel(firstname: "หมูหวาน", lastname: "", role: "ผู้ดูแล"),
    UserModel(firstname: "ใจดี", lastname: "ดีดีดี", role: "ผู้ดูแล"),
    UserModel(firstname: "หมูหวาน", lastname: "", role: "ผู้ดูแล"),
    UserModel(firstname: "ใจดี", lastname: "ดีดีดี", role: "ผู้ดูแล"),
    UserModel(firstname: "หมูหวาน", lastname: "", role: "ผู้ดูแล"),
    UserModel(firstname: "ใจดี", lastname: "ดีดีดี", role: "ผู้ดูแล"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 60),
                child: const Center(
                  child: Text(
                    'รายชื่อแอดมิน',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const Text(
                  'ผู้ดูแลปัจจุบัน',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Line(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: userList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == userList.length) {
                    return Column(
                      children: const [
                        SizedBox(height: 60),
                        Line(),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.asset("assets/images/ic_user.png"),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${userList[index].firstname} ${userList[index].lastname}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "${userList[index].role}",
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: const Text(
                                "แก้ไข",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        const Line(),
                      ],
                    );
                  }
                },
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  MainButton(
                    width: MediaQuery.of(context).size.width * 0.7,
                    ontab: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterAdminPage(),
                        ),
                      );
                    },
                    title: 'เพิ่มแอดมิน',
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    width: MediaQuery.of(context).size.width * 0.7,
                    ontab: () {},
                    title: 'ออกจากระบบ',
                    color: const Color(0xff4A4A4A),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
