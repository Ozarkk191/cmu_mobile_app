import 'dart:developer';

import 'package:cmu_mobile_app/api/auth_api.dart';
import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool loading = false;
  var snackBar = const SnackBar(
    content: Text('ทำการเปลี่ยนรหัสผ่านเรียบร้อย'),
  );
  Future<void> resetPassword() async {
    setState(() {
      loading = true;
    });
    ResetPasswordModel pass = ResetPasswordModel(
      userId: widget.id,
      password: password.text,
    );
    await AuthApi.updatePassword(param: pass).then((value) {
      log(value.toString());
      if (value["message"] == "success") {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      }
    });
  }

  bool check() {
    if (password.text.isEmpty || confirmPassword.text.isEmpty) {
      return false;
    } else if (password.text.length < 6 || confirmPassword.text.length < 6) {
      return false;
    } else if (password.text != confirmPassword.text) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
          child: LoadingBox(
        loading: loading,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Text("เปลี่ยนรหัสผ่าน"),
                const SizedBox(height: 40),
                textField(
                  context: context,
                  controller: password,
                  hint: "รหัสผ่านใหม่",
                ),
                const SizedBox(height: 10),
                textField(
                  context: context,
                  controller: confirmPassword,
                  hint: "ยืนยันรหัสผ่านใหม่",
                ),
                const SizedBox(height: 40),
                MainButton(
                  enabled: check(),
                  width: MediaQuery.of(context).size.width * 0.6,
                  ontab: resetPassword,
                  title: "ยืนยัน",
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Container textField({
    required BuildContext context,
    required TextEditingController controller,
    required String hint,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.orange,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
