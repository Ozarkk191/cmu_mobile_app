import 'package:cmu_mobile_app/src/widgets/avatar/custom_avatar.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

import 'edit_personel_page.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(0, 60, 0, 20),
              child: const Center(
                child: Text(
                  'ข้อมูลส่วนตัว',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const CustomAvatar(
              path: 'assets/images/ic_user.png',
              size: 80,
            ),
            const Text(
              'แอดมิน หวาน',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  _menu(
                    'แก้ไขข้อมูลส่วนตัว',
                    Icons.arrow_forward_ios_sharp,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditPersonnelPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  _menu(
                    'เปลี่ยนรหัสผ่าน ',
                    Icons.arrow_forward_ios_sharp,
                    onTap: () {},
                  ),
                  const SizedBox(height: 30),
                  _menu(
                    'เกี่ยวกับเรา',
                    Icons.arrow_forward_ios_sharp,
                    onTap: () {},
                  ),
                  const SizedBox(height: 60),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'ออกจากระบบ',
                      style: TextStyle(color: Color(0xffFF6600), fontSize: 20),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _menu(String title, IconData icon, {required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          Icon(icon)
        ],
      ),
    );
  }
}
