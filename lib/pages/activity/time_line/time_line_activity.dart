import 'package:cmu_mobile_app/pages/activity/cover_questionnaire_page.dart';
import 'package:cmu_mobile_app/pages/activity/question_alcohol_behavior_page.dart';
import 'package:cmu_mobile_app/utils/time_line.dart';
import 'package:flutter/material.dart';

import '../cover_page.dart';
import '../personal_page.dart';
import '../question_page.dart';
import '../question_page2.dart';
import '../video_player_page.dart';

class TimelineActivity extends StatefulWidget {
  final int index;
  final String role;
  const TimelineActivity({Key? key, required this.index, required this.role})
      : super(key: key);

  @override
  State<TimelineActivity> createState() => _TimelineActivityState();
}

class _TimelineActivityState extends State<TimelineActivity> {
  static final PageController controller = PageController();
  String btnText = "เริ่ม";
  bool test = true;

  List<Widget> getData() {
    if (widget.role == "วัยรุ่น") {
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
    } else {
      switch (widget.index) {
        case 0:
          return parentWidget;
        case 1:
          return parentWidget1;
        case 2:
          return parentWidget2;
        case 3:
          return parentWidget3;
        case 4:
          return parentWidget4;
        case 5:
          return parentWidget5;
        case 6:
          return parentWidget6;
        case 7:
          return parentWidget7;
        case 8:
          return parentWidget8;
        case 9:
          return parentWidget9;
        case 10:
          return parentWidget10;
        case 11:
          return parentWidget;

        default:
          return parentWidget;
      }
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
    PersonalPage(
      controller: controller,
      nextPage: 2,
    ),
    QuestionAlcoholBehaviorPage(
      controller: controller,
      nextPage: 3,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: "แบบประเมินปัญหาการดื่มสุรา (AUDIT)",
      controller: controller,
      nextPage: 4,
      endPage: 9,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: "แบบวัดความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      nextPage: 5,
      endPage: 9,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      nextPage: 6,
      endPage: 9,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType:
          "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      nextPage: 7,
      endPage: 9,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType:
          "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่",
      controller: controller,
      nextPage: 8,
      endPage: 9,
    ),
    QusetionPage(
      groupName: 'วัยรุ่น',
      quizType: "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      nextPage: 9,
      endPage: 9,
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
      endPage: 5,
    ),
    VideoPlayPage(
      link: activity1[3],
      controller: controller,
      nextPage: 4,
      endPage: 5,
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
      endPage: 4,
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
      endPage: 4,
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
      endPage: 4,
    ),
    VideoPlayPage(
      link: activity4[2],
      controller: controller,
      nextPage: 3,
      endPage: 4,
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
      endPage: 4,
    ),
    VideoPlayPage(
      link: activity5[2],
      controller: controller,
      nextPage: 3,
      endPage: 4,
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
      endPage: 4,
    ),
    VideoPlayPage(
      link: activity6[2],
      controller: controller,
      nextPage: 3,
      endPage: 4,
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
      endPage: 4,
    ),
    VideoPlayPage(
      link: activity7[2],
      controller: controller,
      nextPage: 3,
      endPage: 4,
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
      endPage: 5,
    ),
    VideoPlayPage(
      link: activity8[2],
      controller: controller,
      nextPage: 3,
      endPage: 5,
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
      endPage: 5,
    ),
    VideoPlayPage(
      link: activity9[2],
      controller: controller,
      nextPage: 3,
      endPage: 5,
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
      endPage: 5,
    ),
    VideoPlayPage(
      link: activity10[2],
      controller: controller,
      nextPage: 3,
      endPage: 5,
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

  List<Widget> parentWidget1 = [
    CoverPage(
      title: parent1[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent1[1],
      controller: controller,
      nextPage: 2,
      endPage: 3,
    ),
    VideoPlayPage(
      link: parent1[2],
      controller: controller,
      nextPage: 3,
      endPage: 3,
    ),
  ];
  List<Widget> parentWidget2 = [
    CoverPage(
      title: parent2[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent2[1],
      controller: controller,
      nextPage: 2,
      endPage: 2,
    ),
  ];
  List<Widget> parentWidget3 = [
    CoverPage(
      title: parent3[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent3[1],
      controller: controller,
      nextPage: 2,
      endPage: 2,
    ),
  ];
  List<Widget> parentWidget4 = [
    CoverPage(
      title: parent4[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent4[1],
      controller: controller,
      nextPage: 2,
      endPage: 5,
    ),
    VideoPlayPage(
      link: parent4[2],
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    QuestionPage2(
      activityName: parent4[3],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 4,
      endPage: 4,
    )
  ];
  List<Widget> parentWidget5 = [
    CoverPage(
      title: parent5[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent5[1],
      controller: controller,
      nextPage: 2,
      endPage: 5,
    ),
    VideoPlayPage(
      link: parent5[2],
      controller: controller,
      nextPage: 3,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: parent5[3],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: parent5[4],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    )
  ];
  List<Widget> parentWidget6 = [
    CoverPage(
      title: parent6[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent6[1],
      controller: controller,
      nextPage: 2,
      endPage: 5,
    ),
    VideoPlayPage(
      link: parent6[2],
      controller: controller,
      nextPage: 3,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: parent6[3],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: parent6[4],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    )
  ];
  List<Widget> parentWidget7 = [
    CoverPage(
      title: parent7[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent7[1],
      controller: controller,
      nextPage: 2,
      endPage: 5,
    ),
    VideoPlayPage(
      link: parent7[2],
      controller: controller,
      nextPage: 3,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: parent7[3],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 4,
      endPage: 5,
    ),
    QuestionPage2(
      activityName: parent7[4],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 5,
      endPage: 5,
    )
  ];
  List<Widget> parentWidget8 = [
    CoverPage(
      title: parent8[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent8[1],
      controller: controller,
      nextPage: 2,
      endPage: 4,
    ),
    QuestionPage2(
      activityName: parent8[2],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    QuestionPage2(
      activityName: parent8[3],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 4,
      endPage: 4,
    )
  ];
  List<Widget> parentWidget9 = [
    CoverPage(
      title: parent9[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent9[1],
      controller: controller,
      nextPage: 2,
      endPage: 4,
    ),
    QuestionPage2(
      activityName: parent9[2],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    QuestionPage2(
      activityName: parent9[3],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 4,
      endPage: 4,
    )
  ];
  List<Widget> parentWidget10 = [
    CoverPage(
      title: parent10[0],
      controller: controller,
      nextPage: 1,
    ),
    VideoPlayPage(
      link: parent10[1],
      controller: controller,
      nextPage: 2,
      endPage: 4,
    ),
    QuestionPage2(
      activityName: parent10[2],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    QuestionPage2(
      activityName: parent10[3],
      groupName: 'ผู้ปกครอง',
      controller: controller,
      nextPage: 4,
      endPage: 4,
    )
  ];
  List<Widget> parentWidget = [
    CoverPage(
      title: parent11[0],
      controller: controller,
      nextPage: 1,
      endPage: 1,
    ),
  ];
}
