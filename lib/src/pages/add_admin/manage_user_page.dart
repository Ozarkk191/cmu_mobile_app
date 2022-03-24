import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/auth_api.dart';
import 'package:cmu_mobile_app/models/all_user_model.dart';
import 'package:cmu_mobile_app/src/pages/add_admin/user_list_page.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class ManageUserPage extends StatefulWidget {
  const ManageUserPage({Key? key}) : super(key: key);

  @override
  State<ManageUserPage> createState() => _ManageUserPageState();
}

class _ManageUserPageState extends State<ManageUserPage> {
  late PageController controller = PageController();
  // AllUserModel allUser = AllUserModel();
  int index = 0;
  // User user = User();

  Future<AllUserModel> getAllUser() async {
    return await AuthApi.getAllUser();
  }

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: FutureBuilder(
            future: getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                AllUserModel allUser = AllUserModel.fromJson(
                  jsonDecode(jsonEncode(data)),
                );
                return SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        tapper(context),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 150,
                          child: PageView(
                            controller: controller,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              UserListPage(userList: allUser.users!.student!),
                              UserListPage(userList: allUser.users!.parent!),
                              UserListPage(userList: allUser.users!.teacher!),
                              UserListPage(userList: allUser.users!.monk!),
                              UserListPage(userList: allUser.users!.hospital!),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Padding tapper(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                          controller.jumpToPage(index);
                        });
                      },
                      child: const Center(
                        child: Text("student"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                          controller.jumpToPage(index);
                        });
                      },
                      child: const Center(
                        child: Text("parent"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                          controller.jumpToPage(index);
                        });
                      },
                      child: const Center(
                        child: Text("teacher"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 3;
                          controller.jumpToPage(index);
                        });
                      },
                      child: const Center(
                        child: Text("monk"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 4;
                          controller.jumpToPage(index);
                        });
                      },
                      child: const Center(
                        child: Text("hospital"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 5,
                    color: index == 0 ? const Color(0xFFFF6600) : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: index == 1 ? const Color(0xFFFF6600) : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: index == 2 ? const Color(0xFFFF6600) : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: index == 3 ? const Color(0xFFFF6600) : Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: index == 4 ? const Color(0xFFFF6600) : Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
