import 'dart:convert';

import 'package:cmu_mobile_app/models/user_model.dart';
import 'package:cmu_mobile_app/services/http/http_request.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/dashborad/dashborad_page.dart';
import 'package:cmu_mobile_app/src/pages/list_group/list_group_page.dart';
import 'package:cmu_mobile_app/src/pages/splash_screen/splash_page.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/navigation_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int initPage;

  const HomePage({
    Key? key,
    required this.initPage,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController controller = PageController();
  String role = "student";
  bool loading = true;
  late List<Widget> pageList = [];
  late List<Widget> itemList = [];

  void _onItemTapped(int index) {
    setState(() {
      controller.jumpToPage(index);
    });
  }

  @override
  void initState() {
    getRole();
    controller = PageController(initialPage: widget.initPage);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getRole() async {
    final data = await SharedPref.getStringPref(key: "user");
    UserModel user = UserModel.fromJson(jsonDecode(data));
    role = user.role!;
    pageList = pageOfRole(role);
    itemList = itemOfRole(role);
    setState(() {
      loading = false;
    });
  }

  List<Widget> pageOfRole(String role) {
    List<Widget> teacherList = [
      const DashboradPage(),
      const ListGroupPage(),
    ];
    List<Widget> parentList = [
      const DashboradPage(),
      const ListGroupPage(),
    ];
    List<Widget> monkList = [
      const DashboradPage(),
      const ListGroupPage(),
    ];
    List<Widget> studentList = [
      const DashboradPage(),
    ];
    switch (role) {
      case "teacher":
        return teacherList;
      case "student":
        return studentList;
      case "parent":
        return parentList;
      case "monk":
        return monkList;
      default:
        return studentList;
    }
  }

  List<Widget> itemOfRole(String role) {
    List<Widget> teacherList = [
      NavigationTab(
        icon: Icons.home,
        title: 'หน้าหลัก',
        ontap: () => _onItemTapped(0),
      ),
      NavigationTab(
        icon: Icons.ballot_rounded,
        title: 'รายชื่อกลุ่ม',
        ontap: () => _onItemTapped(1),
      ),
      NavigationTab(
        icon: Icons.logout,
        title: 'ออกจากระบบ',
        ontap: () {
          HttpRequest.signOut().then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ),
            );
          });
        },
      ),
    ];
    List<Widget> parentList = [
      NavigationTab(
        icon: Icons.home,
        title: 'หน้าหลัก',
        ontap: () => _onItemTapped(0),
      ),
      NavigationTab(
        icon: Icons.ballot_rounded,
        title: 'รายชื่อกลุ่ม',
        ontap: () => _onItemTapped(1),
      ),
      NavigationTab(
        icon: Icons.logout,
        title: 'ออกจากระบบ',
        ontap: () {
          HttpRequest.signOut().then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ),
            );
          });
        },
      ),
    ];
    List<Widget> monkList = [
      NavigationTab(
        icon: Icons.home,
        title: 'หน้าหลัก',
        ontap: () => _onItemTapped(0),
      ),
      NavigationTab(
        icon: Icons.ballot_rounded,
        title: 'รายชื่อกลุ่ม',
        ontap: () => _onItemTapped(1),
      ),
      NavigationTab(
        icon: Icons.logout,
        title: 'ออกจากระบบ',
        ontap: () {
          HttpRequest.signOut().then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ),
            );
          });
        },
      ),
    ];
    List<Widget> studentList = [
      NavigationTab(
        icon: Icons.home,
        title: 'หน้าหลัก',
        ontap: () => _onItemTapped(0),
      ),
      NavigationTab(
        icon: Icons.logout,
        title: 'ออกจากระบบ',
        ontap: () {
          HttpRequest.signOut().then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ),
            );
          });
        },
      ),
    ];
    switch (role) {
      case "teacher":
        return teacherList;
      case "student":
        return studentList;
      case "parent":
        return parentList;
      case "monk":
        return monkList;
      default:
        return studentList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: pageList,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF6600),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: itemList,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
