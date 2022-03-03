import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/api/question_api.dart';
import 'package:cmu_mobile_app/models/dashborad_model.dart';
import 'package:cmu_mobile_app/models/user_auth_model.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/src/pages/activity/time_line/time_line_activity.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';

import 'package:cmu_mobile_app/utils/assessment_list.dart';

import 'package:flutter/material.dart';

class DashboradPage extends StatefulWidget {
  const DashboradPage({Key? key}) : super(key: key);

  @override
  _DashboradPageState createState() => _DashboradPageState();
}

class _DashboradPageState extends State<DashboradPage> {
  String role = "วัยรุ่น";
  final DateTime thisTime = DateTime.now();
  int hour = 0;

  Future<List<DashboradModel>> getRole() async {
    final _role = await SharedPref.getStringPref(key: "user");
    Map<String, dynamic> data = jsonDecode(_role) as Map<String, dynamic>;
    UserAuthModel user = UserAuthModel.fromJson(data);
    log("${user.role}");
    if (user.role! == "student") {
      role = user.role!;
      return studentList;
    } else if (user.role! == "parent") {
      role = user.role!;
      return parentList;
    } else if (user.role! == "monk") {
      role = user.role!;
      return itemListMonk;
    } else {
      role = user.role!;
      return itemList3;
    }
  }

  @override
  void initState() {
    getEvent();
    super.initState();
  }

  void getEvent() async {
    final res = await QuestionApi.getEvent();
    if (res["message"] == "success") {
      if (res["result"] != null) {
        DateTime stratTime = DateTime.parse(res["result"]);
        hour = thisTime.difference(stratTime).inHours;

        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  void toTimeLine(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TimelineActivity(
          index: index,
          role: role,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: FutureBuilder(
          future: getRole(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<DashboradModel> list = snapshot.data;
              return Container(
                width: _size.width,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        width: _size.width * 0.35,
                        height: _size.width * 0.35,
                        child: Image.asset('assets/images/app_icon.png'),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 0,
                          ),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _itemBox(
                              _size,
                              title: list[index].title,
                              color: list[index].color,
                              path: list[index].path,
                              onTap: () {
                                switch (index) {
                                  case 0:
                                  case 1:
                                    if (hour != 0) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 2:
                                    if (hour >= 48) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 3:
                                    if (hour >= 96) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 4:
                                    if (hour >= 144) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 5:
                                    if (hour >= 192) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 6:
                                    if (hour >= 240) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 7:
                                    if (hour >= 288) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 8:
                                    if (hour >= 336) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 9:
                                    if (hour >= 384) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 10:
                                    if (hour >= 432) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 11:
                                    if (hour >= 480) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  case 12:
                                    if (hour >= 528) {
                                      toTimeLine(index);
                                    } else {
                                      log("active $index");
                                    }
                                    break;
                                  default:
                                }
                              },
                            );
                          },
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
          },
        ),
      ),
    );
  }

  Widget _itemBox(
    Size _size, {
    required String title,
    required String path,
    required Color color,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: _size.width * 0.17,
            height: _size.width * 0.17,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: SizedBox(
                      height: _size.width * 0.15, child: Image.asset(path)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
