import 'dart:developer';

import 'package:cmu_mobile_app/models/all_user_model.dart';
import 'package:cmu_mobile_app/src/pages/list_group/not_done/not_done_page.dart';
import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/avatar/custom_avatar.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/src/widgets/line/line.dart';
import 'package:cmu_mobile_app/src/widgets/textfields/search_textfield.dart';

import 'package:flutter/material.dart';

import '../scores/score_main_page.dart';

class GroupPage extends StatefulWidget {
  final String groupName;
  final List<User> listUser;
  final String path;
  const GroupPage({
    Key? key,
    required this.groupName,
    required this.listUser,
    required this.path,
  }) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(
          children: [
            CustomAppbar(
              onTap: () {
                Navigator.pop(context);
              },
              title: widget.groupName,
            ),
            const SizedBox(height: 40),
            const SearchTextField(),
            const SizedBox(height: 20),
            Visibility(
              visible:
                  widget.groupName == "student" || widget.groupName == "parent",
              child: MainButton(
                ontab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotDonePage(
                        role: widget.groupName,
                      ),
                    ),
                  );
                },
                width: MediaQuery.of(context).size.width * 0.85,
                title: "คนที่ยังไม่ได้ทำกิจกรรม",
              ),
            ),
            const SizedBox(height: 20),
            const Line(),
            Expanded(
              child: ListView.builder(
                itemCount: widget.listUser.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      log(widget.listUser[index].toJson().toString());
                      log(widget.groupName);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScoreMainPage(
                            role: widget.groupName,
                            user: widget.listUser[index],
                          ),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ScoreMainPage(
                      //       user: widget.listUser[index],
                      //       role: widget.groupName,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            children: [
                              CustomAvatar(
                                path: widget.path,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.listUser[index].name}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                        const Line(),
                      ],
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
