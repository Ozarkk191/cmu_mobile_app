import 'package:cmu_mobile_app/pages/activity/cover_questionnaire_page.dart';
import 'package:cmu_mobile_app/pages/activity/question_alcohol_behavior_page.dart';
import 'package:cmu_mobile_app/utils/time_line.dart';
import 'package:flutter/material.dart';

import '../cover_page.dart';
import '../question_page.dart';
import '../question_page2.dart';
import '../video_player_page.dart';

class TimelineActivity extends StatefulWidget {
  final int index;
  const TimelineActivity({Key? key, required this.index}) : super(key: key);

  @override
  State<TimelineActivity> createState() => _TimelineActivityState();
}

class _TimelineActivityState extends State<TimelineActivity> {
  static final PageController controller = PageController();
  String btnText = "เริ่ม";
  bool test = true;

  List<Widget> getData() {
    switch (widget.index) {
      case 0:
        return questionWidgetList;
      case 1:
        return activity1WidgetList;
      case 2:
        return activity2WidgetList;
      case 3:
        return activity3WidgetList;
      case 4:
        return activity4WidgetList;
      case 5:
        return activity5WidgetList;
      case 6:
        return activity6WidgetList;
      case 7:
        return activity7WidgetList;
      case 8:
        return activity8WidgetList;
      case 9:
        return activity9WidgetList;
      case 10:
        return activity10WidgetList;
      case 11:
        return questionWidgetList;

      default:
        return questionWidgetList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: getData(),
          ),
        ],
      ),
    );
  }

  List<Widget> questionWidgetList = [
    CoverQuestionnairePage(
      controller: controller,
      nextPage: 1,
    ),
    QuestionAlcoholBehaviorPage(
      controller: controller,
      nextPage: 2,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: "แบบประเมินปัญหาการดื่มสุรา (AUDIT)",
      controller: controller,
      nextPage: 3,
      endPage: 8,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: "แบบวัดความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      nextPage: 4,
      endPage: 8,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      nextPage: 5,
      endPage: 8,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType:
          "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      nextPage: 6,
      endPage: 8,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType:
          "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่",
      controller: controller,
      nextPage: 7,
      endPage: 8,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      nextPage: 8,
      endPage: 8,
    ),
  ];
  List<Widget> activity1WidgetList = [
    CoverPage(
      title: activity1[0],
      controller: controller,
      nextPage: 1,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: activity1[1],
      controller: controller,
      nextPage: 2,
      endPage: 5,
    ),
    VideoPlayPage(
      link: activity1[2],
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: activity1[3],
      controller: controller,
      nextPage: 4,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: activity1[4],
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> activity2WidgetList = [
    CoverPage(
      title: activity2[0],
      controller: controller,
      nextPage: 1,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: activity2[1],
      controller: controller,
      nextPage: 2,
      endPage: 4,
    ),
    VideoPlayPage(
      link: activity2[2],
      controller: controller,
      nextPage: 3,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: activity2[3],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> activity3WidgetList = [
    CoverPage(
      title: activity3[0],
      controller: controller,
      nextPage: 1,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: activity3[1],
      controller: controller,
      nextPage: 2,
      endPage: 4,
    ),
    VideoPlayPage(
      link: activity3[2],
      controller: controller,
      nextPage: 3,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: activity3[3],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> activity4WidgetList = [
    CoverPage(
      title: activity4[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: activity4[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity4[2],
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      activityName: activity4[3],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> activity5WidgetList = [
    CoverPage(
      title: activity5[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: activity5[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity5[2],
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      activityName: activity5[3],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: activity5[4],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> activity6WidgetList = [
    CoverPage(
      title: activity6[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: activity6[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity6[2],
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      activityName: activity6[3],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: activity6[4],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> activity7WidgetList = [
    CoverPage(
      title: activity7[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: activity7[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity7[2],
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      activityName: activity7[3],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: activity7[4],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> activity8WidgetList = [
    CoverPage(
      title: activity8[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: activity8[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity8[2],
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      activityName: activity8[3],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: activity8[4],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> activity9WidgetList = [
    CoverPage(
      title: activity9[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: activity9[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity9[2],
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      activityName: activity9[3],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: activity9[4],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> activity10WidgetList = [
    CoverPage(
      title: activity10[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: activity10[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity10[2],
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      activityName: activity10[3],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: activity10[4],
      groupName: 'วัยรุ่น',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
}
