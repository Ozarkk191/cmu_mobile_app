import 'package:cmu_mobile_app/models/all_user_model.dart';
import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/avatar/custom_avatar.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

import 'lesson_detail_page.dart';
import 'lesson_page.dart';

class GroupContentPage extends StatefulWidget {
  final User user;
  const GroupContentPage({Key? key, required this.user}) : super(key: key);

  @override
  _GroupContentPageState createState() => _GroupContentPageState();
}

class _GroupContentPageState extends State<GroupContentPage> {
  late List<bool> checkList = [false, false, false, false, false];
  late List<bool> checkList2 = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  CustomAppbar(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const CustomAvatar(
                    path: "assets/images/ic_user.png",
                    size: 100,
                  ),
                  Text(
                    "${widget.user.name}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Text(
                    "กลุ่ม วัยรุ่น",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
