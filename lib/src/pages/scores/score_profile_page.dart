import 'dart:developer';

import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/layouts/main_layout.dart';

class ScoreProfilePage extends StatefulWidget {
  final String id;
  final String role;
  const ScoreProfilePage({
    Key? key,
    required this.id,
    required this.role,
  }) : super(key: key);

  @override
  State<ScoreProfilePage> createState() => _ScoreProfilePageState();
}

class _ScoreProfilePageState extends State<ScoreProfilePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var res =
        await ScoreApi.getScore(path: "${widget.role}/profile/${widget.id}");
    log(res.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(children: [
          CustomAppbar(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'Profile',
          ),
        ]),
      ),
    );
  }
}
