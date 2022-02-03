import 'package:cmu_mobile_app/pages/home_page.dart';
import 'package:cmu_mobile_app/pages/quiz_and_assessment/cover_page.dart';
import 'package:cmu_mobile_app/pages/quiz_and_assessment/quiz/question_page.dart';
import 'package:cmu_mobile_app/pages/quiz_and_assessment/video_player_page.dart';
import 'package:cmu_mobile_app/utils/time_line.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';

class TimelineActivity extends StatefulWidget {
  const TimelineActivity({Key? key}) : super(key: key);

  @override
  State<TimelineActivity> createState() => _TimelineActivityState();
}

class _TimelineActivityState extends State<TimelineActivity> {
  final PageController controller = PageController();
  String btnText = "เริ่ม";
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: <Widget>[
              CoverPage(title: timeline[0]),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[1],
              ),
              VideoPlayPage(link: timeline[2]),
              VideoPlayPage(link: timeline[3]),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[4],
              ),
              CoverPage(title: timeline[5]),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[6],
              ),
              VideoPlayPage(link: timeline[7]),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[8],
              ),
              CoverPage(title: timeline[9]),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[10],
              ),
              VideoPlayPage(link: timeline[11]),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[12],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: MainButton(
                ontab: () {
                  if (controller.page!.toInt() == 4 ||
                      controller.page!.toInt() == 8) {
                    btnText = "เริ่ม";
                    controller.jumpToPage(controller.page!.toInt() + 1);
                  } else if (controller.page!.toInt() == 11) {
                    btnText = "เสร็จสิ้น";
                    controller.jumpToPage(controller.page!.toInt() + 1);
                  } else if (controller.page!.toInt() == 12) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(initPage: 0),
                      ),
                    );
                  } else {
                    btnText = "ถัดไป";
                    controller.jumpToPage(controller.page!.toInt() + 1);
                  }
                  setState(() {});
                },
                width: _size.width * 0.6,
                borderRadius: 50,
                title: btnText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
