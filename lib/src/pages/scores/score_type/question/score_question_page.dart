import 'package:flutter/material.dart';

import '../../../../widgets/layouts/main_layout.dart';

class ScoreQuestionPage extends StatefulWidget {
  const ScoreQuestionPage({Key? key}) : super(key: key);

  @override
  State<ScoreQuestionPage> createState() => _ScoreQuestionPageState();
}

class _ScoreQuestionPageState extends State<ScoreQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
