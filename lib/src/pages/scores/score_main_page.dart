import 'package:cmu_mobile_app/src/pages/scores/score_page.dart';
import 'package:cmu_mobile_app/src/pages/scores/score_profile_page.dart';
import 'package:flutter/material.dart';

import '../../../models/all_user_model.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/layouts/main_layout.dart';

class ScoreMainPage extends StatefulWidget {
  final User user;
  final String role;
  const ScoreMainPage({Key? key, required this.user, required this.role})
      : super(key: key);

  @override
  State<ScoreMainPage> createState() => _ScoreMainPageState();
}

class _ScoreMainPageState extends State<ScoreMainPage> {
  List<String> list = [
    "Profile",
    "แบบสอบถาม2",
    "แบบสอบถาม3",
    "แบบสอบถาม4",
    "แบบสอบถาม5",
    "แบบสอบถาม6",
    "แบบสอบถาม7",
    "แบบสอบถาม8"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              CustomAppbar(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'กลุ่ม ${widget.role}',
              ),
              const SizedBox(height: 50),
              ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScoreProfilePage(
                                id: widget.user.id.toString(),
                                role: widget.role,
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScorePage(
                                title: "แบบทดสอบ${index + 1}",
                                id: widget.user.id.toString(),
                                role: widget.role,
                                nameQuestion: 'question${index + 1}',
                              ),
                            ),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(list[index]),
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
            ],
          ),
        ),
      ),
    );
  }
}
