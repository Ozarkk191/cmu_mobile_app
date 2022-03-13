import 'package:cmu_mobile_app/src/pages/scores/score_type/post_test/score_post_test_page.dart';
import 'package:flutter/material.dart';

import '../../../../../models/all_user_model.dart';
import '../../../../widgets/appbar/custom_appbar.dart';
import '../../../../widgets/layouts/main_layout.dart';

class ListPostTestPage extends StatelessWidget {
  final User user;

  const ListPostTestPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listStudent = [
      "แบบทดสอบการเรียนรู้ 1",
      "แบบทดสอบการเรียนรู้ 2",
      "แบบทดสอบการเรียนรู้ 3",
    ];
    return Scaffold(
      body: MainLayout(
        child: Column(
          children: [
            CustomAppbar(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'แบบทดสอบการเรียนรู้',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: listStudent.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScorePostTestPage(
                              title: listStudent[index],
                              subPath: "posttest${index + 1}",
                              userID: user.id.toString(),
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(listStudent[index]),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
