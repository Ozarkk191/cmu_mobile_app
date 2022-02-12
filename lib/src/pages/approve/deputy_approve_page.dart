import 'package:cmu_mobile_app/models/user_model.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/src/widgets/line/line.dart';

import 'package:flutter/material.dart';

import 'approve_page.dart';

class DeputyApprovePage extends StatefulWidget {
  const DeputyApprovePage({Key? key}) : super(key: key);

  @override
  _DeputyApprovePageState createState() => _DeputyApprovePageState();
}

class _DeputyApprovePageState extends State<DeputyApprovePage> {
  late List<UserModel> userList = [
    UserModel(
        firstname: "ปราณี",
        lastname: "ใจดี",
        namePrefix: "นาง",
        regisDate: "24 มีนาคม 2564",
        group: "คุณครู"),
    UserModel(
        firstname: "ซี",
        lastname: "",
        namePrefix: "นาย",
        regisDate: "24 มีนาคม 2564",
        group: "พระสงฆ์"),
    UserModel(
        firstname: "สมร",
        lastname: "สมใจ",
        namePrefix: "นาง",
        regisDate: "24 มีนาคม 2564",
        group: "วัยรุ่น"),
    UserModel(
        firstname: "อี",
        lastname: "",
        namePrefix: "นาย",
        regisDate: "24 มีนาคม 2564",
        group: "ผู้ปกครอง"),
    UserModel(
        firstname: "เอฟ",
        lastname: "",
        namePrefix: "นางสาว",
        regisDate: "24 มีนาคม 2564",
        group: "รพสต สะรวง"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(0, 60, 0, 100),
              child: const Center(
                child: Text(
                  'คำขออนุมัติ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Line(),
            Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApprovePage(
                            user: userList[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.asset("assets/images/ic_user.png"),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${userList[index].namePrefix} ${userList[index].firstname} ${userList[index].lastname}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Text(
                                  "ได้สมัครเข้าร่วม...app",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "${userList[index].regisDate}",
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Line(),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
