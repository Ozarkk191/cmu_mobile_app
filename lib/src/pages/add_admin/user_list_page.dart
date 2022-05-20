import 'dart:developer';

import 'package:cmu_mobile_app/api/auth_api.dart';
import 'package:cmu_mobile_app/models/all_user_model.dart';
import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:cmu_mobile_app/src/pages/add_admin/reset_password_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key, required this.userList}) : super(key: key);
  final List<User> userList;

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  var snackBar = const SnackBar(
    content: Text('ทำการลบเรียบร้อย'),
  );
  Future<void> deleteUser({required String id, required int index}) async {
    await AuthApi.deleteUser(userID: id).then((value) {
      Navigator.of(context).pop();
      if (value["message"] == "success") {
        widget.userList.removeAt(index);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {});
      } else if (value["message"] == "ต้องลบผู้ปกครองก่อนถึงจะลบวัยรุ่นได้") {
        getChildren(id: int.parse(id), index: index, title: value["message"]);
      }
    });
  }

  Future<void> deleteChildren({required String id}) async {
    await AuthApi.deleteUser(userID: id).then((value) {
      Navigator.of(context).pop();
      if (value["message"] == "success") {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {});
      }
    });
  }

  Future<void> getChildren(
      {required int id, required int index, required String title}) async {
    ChildrenModel children = ChildrenModel(userId: id);
    await AuthApi.getChildren(param: children).then((value) {
      log(value.toJson().toString());
      _showParent(title, value.id.toString());
    });
  }

  Future<void> _showMyDialog({required String id, required int index}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('แจ้งเตือน'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('คุณต้องการที่จะทำการลบผู้ใช้งานคนนี้ใช่หรือไม่'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ใช่'),
              onPressed: () {
                deleteUser(
                  id: widget.userList[index].id!.toString(),
                  index: index,
                );
              },
            ),
            TextButton(
              child: const Text('ไม่'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showParent(String title, String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('แจ้งเตือน'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(title),
                const Text('คุณต้องการที่จะทำการลบวัยรุ่นคนนี้ใช่หรือไม่'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ใช่'),
              onPressed: () {
                deleteChildren(id: id);
              },
            ),
            TextButton(
              child: const Text('ไม่'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: widget.userList.isEmpty
            ? const Center(
                child: Text("ไม่พบข้อมูล"),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.userList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(widget.userList[index].name!),
                                ),
                                MainButton(
                                  height: 35,
                                  ontab: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResetPasswordPage(
                                            id: widget.userList[index].id!),
                                      ),
                                    );
                                  },
                                  title: "เปลี่ยน Password",
                                ),
                                const SizedBox(width: 5),
                                MainButton(
                                  height: 35,
                                  width: 60,
                                  ontab: () {
                                    // log(widget.userList[index].id!.toString());
                                    _showMyDialog(
                                      id: widget.userList[index].id!.toString(),
                                      index: index,
                                    );
                                  },
                                  title: "ลบ",
                                  fontSize: 7,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
