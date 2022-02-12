import 'package:cmu_mobile_app/models/user_model.dart';
import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/avatar/custom_avatar.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

import 'lesson_detail_page.dart';
import 'lesson_page.dart';

class GroupContentPage extends StatefulWidget {
  final UserModel user;
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
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const CustomAvatar(
                        path: "assets/images/ic_user.png",
                        size: 100,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${widget.user.namePrefix}${widget.user.firstname} ${widget.user.lastname}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        "กลุ่ม วัยรุ่น",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "เข้าใช้งานเมื่อ...........",
                            ),
                            const Text(
                              "ระยะเวลาการใช้งาน ..............",
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "ข้อมูลเนื้อหา",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 210,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: checkList[index],
                                          onChanged: (val) {
                                            setState(() {
                                              checkList[index] =
                                                  !checkList[index];
                                            });
                                          },
                                        ),
                                        Expanded(
                                            child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LessonPage(),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('บทที่ ${index + 1}'),
                                              const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                              ),
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "ข้อมูลคะแนน",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 210,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: checkList2.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            value: checkList2[index],
                                            onChanged: (val) {
                                              setState(() {
                                                checkList2[index] =
                                                    !checkList2[index];
                                              });
                                            }),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LessonDetailPage(
                                                    lesson:
                                                        'บทที่ ${index + 1}',
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('บทที่ ${index + 1}'),
                                                const Icon(Icons
                                                    .arrow_forward_ios_rounded),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomAppbar(
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
