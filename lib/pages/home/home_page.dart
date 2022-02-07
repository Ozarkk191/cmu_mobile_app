import 'package:cmu_mobile_app/pages/add_admin/admin_list_page.dart';
import 'package:cmu_mobile_app/pages/approve/deputy_approve_page.dart';
import 'package:cmu_mobile_app/pages/dashborad/dashborad_page.dart';
import 'package:cmu_mobile_app/pages/list_group/list_group_page.dart';
import 'package:cmu_mobile_app/pages/personel/personel_page.dart';
import 'package:cmu_mobile_app/widgets/layouts/navigation_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int initPage;
  const HomePage({Key? key, required this.initPage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController controller = PageController();
  void _onItemTapped(int index) {
    setState(() {
      controller.jumpToPage(index);
    });
  }

  @override
  void initState() {
    controller = PageController(initialPage: widget.initPage);
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
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                DashboradPage(),
                ListGroupPage(),
                AdminListPage(),
                PersonalPage(),
              ],
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
                children: [
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
                    icon: Icons.person_add_alt_1_sharp,
                    title: 'เพิ่มแอดมิน',
                    ontap: () => _onItemTapped(2),
                  ),
                  NavigationTab(
                    icon: Icons.person,
                    title: 'แอดมิน',
                    ontap: () => _onItemTapped(3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
