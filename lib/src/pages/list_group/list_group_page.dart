import 'dart:convert';
import 'dart:developer';
import 'package:cmu_mobile_app/api/auth_api.dart';
import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/models/all_user_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/cards/card_group.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

import 'group_page.dart';

class ListGroupPage extends StatefulWidget {
  const ListGroupPage({
    Key? key,
    required this.controller,
    required this.role,
  }) : super(key: key);
  final PageController controller;
  final String role;

  @override
  State<ListGroupPage> createState() => _ListGroupPageState();
}

class _ListGroupPageState extends State<ListGroupPage> {
  AllUserModel allUser = AllUserModel();
  List<User> userList = <User>[];
  User user = User();
  String role = "";
  Widget page = Container();
  void getRole() {
    switch (widget.role) {
      case "parent":
        role = "ผู้ปกครอง";
        userList = allUser.users!.student!;
        int myKidID = user.studentId!;
        user = userList.where((element) => element.id == myKidID).first;
        page = parentPage();
        break;
      case "monk":
        page = teacherPage();
        role = "พระสงฆ์";
        break;
      // case "student":
      //   role = "วัยรุ่น";
      //   break;
      case "teacher":
        role = "ครู";
        page = teacherPage();
        break;
      case "hospital":
        role = "รพสต สะลวง";
        page = hospitalPage();
        break;
    }
    setState(() {});
  }

  Future<void> getAllUser() async {
    allUser = await AuthApi.getAllUser();
    final data = await SharedPref.getStringPref(key: "user");
    user = User.fromJson(jsonDecode(data));
    getRole();
  }

  @override
  void initState() {
    getAllUser();
    super.initState();
  }

  void _onNextPage(
      {required String groupName,
      required List<User> listUser,
      required String path}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroupPage(
          groupName: groupName,
          listUser: listUser,
          path: path,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbar(
                onTap: () {
                  widget.controller.jumpToPage(0);
                },
                title: 'กลุ่ม $role',
              ),
              const SizedBox(height: 50),
              page,
              Visibility(
                visible: widget.role == "hospital",
                child: MainButton(
                  title: "START",
                  ontab: () async {
                    await QuestionApi.setEvent().then((value) {
                      if (value["message"] == "success") {
                        log(value["message"].toString());
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox teacherPage() {
    return SizedBox(
      child: Wrap(
        children: [
          teenCard(),
        ],
      ),
    );
  }

  SizedBox hospitalPage() {
    return SizedBox(
      child: Wrap(
        children: [
          teenCard(),
          parentCard(),
          teacherCard(),
          monkCard(),
        ],
      ),
    );
  }

  Container monkCard() {
    return row2item(
      child: CardGroup(
        color: const Color(0xfff57970),
        groupTitle: 'กลุ่ม พระสงฆ์',
        path: 'assets/images/ic_monk.png',
        onTap: () {
          _onNextPage(
            path: 'assets/images/ic_monk.png',
            groupName: "กลุ่มพระสงฆ์",
            listUser: allUser.users!.monk!,
          );
        },
      ),
    );
  }

  Container teacherCard() {
    return row2item(
      child: CardGroup(
        color: const Color(0xffbb71f5),
        groupTitle: 'กลุ่ม คุณครู',
        path: 'assets/images/ic_teacher.png',
        onTap: () {
          _onNextPage(
            path: 'assets/images/ic_teacher.png',
            groupName: "กลุ่มคุณครู",
            listUser: allUser.users!.teacher!,
          );
        },
      ),
    );
  }

  Container parentCard() {
    return row2item(
      child: CardGroup(
        color: const Color(0xfff9b931),
        groupTitle: 'กลุ่ม ผู้ปกครอง',
        path: 'assets/images/ic_parent.png',
        onTap: () {
          _onNextPage(
            path: 'assets/images/ic_parent.png',
            groupName: "กลุ่มผู้ปกครอง",
            listUser: allUser.users!.parent!,
          );
        },
      ),
    );
  }

  Container teenCard() {
    return row2item(
      child: CardGroup(
        color: const Color(0xff71c6f5),
        groupTitle: 'กลุ่ม วัยรุ่น',
        path: 'assets/images/ic_teen.png',
        onTap: () {
          _onNextPage(
            path: 'assets/images/ic_teen.png',
            groupName: "กลุ่มวัยรุ่น",
            listUser: allUser.users!.student!,
          );
        },
      ),
    );
  }

  Container row2item({required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: child,
      ),
    );
  }

  Expanded parentPage() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(
            child: Text('นักเรียนในการปกครองของคุณ'),
          ),
          Text(
            "${user.name}",
            style: const TextStyle(fontSize: 20),
          ),
          const Text(
            "ดูรายละเอียด>>",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
