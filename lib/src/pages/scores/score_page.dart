import 'dart:developer';

import 'package:cmu_mobile_app/api/score_api.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/layouts/main_layout.dart';

class ScorePage extends StatefulWidget {
  final String id;
  final String role;
  final String nameQuestion;
  final String title;
  const ScorePage({
    Key? key,
    required this.id,
    required this.role,
    required this.nameQuestion,
    required this.title,
  }) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    String path = "${widget.role}/${widget.nameQuestion}/${widget.id}";
    log("path :: $path");
    var res = await ScoreApi.getScore(path: path);
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
            title: widget.title,
          ),
        ]),
      ),
    );
  }
}
