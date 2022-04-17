import 'package:cmu_mobile_app/src/pages/activity/question/quest_1.dart';
import 'package:cmu_mobile_app/src/pages/activity/question/quest_2.dart';
import 'package:cmu_mobile_app/src/pages/activity/question/quest_3.dart';
import 'package:cmu_mobile_app/src/pages/activity/question/quest_4.dart';
import 'package:cmu_mobile_app/src/pages/activity/question/quest_5.dart';
import 'package:cmu_mobile_app/src/pages/activity/question/quest_audit_page.dart';
import 'package:cmu_mobile_app/src/pages/activity/question/question_alcohol_behavior_page.dart';
import 'package:cmu_mobile_app/src/pages/activity/question/question_page10.dart';
import 'package:cmu_mobile_app/src/pages/activity/question/question_page2.dart';
import 'package:cmu_mobile_app/utils/quiz_list.dart';
import 'package:cmu_mobile_app/utils/time_line.dart';
import 'package:flutter/material.dart';

import '../cover_page.dart';
import '../cover_questionnaire_page.dart';
import '../personal_page.dart';
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

  List<Widget> teen(int index) {
    switch (index) {
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
        return activity11WidgetList;

      default:
        return questionWidgetList;
    }
  }

  List<Widget> parent(int index) {
    switch (index) {
      case 0:
        return parentQuestWidget;
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

  List<Widget> monk(int index) {
    switch (index) {
      case 0:
        return monkQuest;
      case 1:
        return monkWidget1;
      case 2:
        return monkWidget2;
      case 3:
        return monkWidget3;
      case 4:
        return monkWidget4;
      case 5:
        return monkWidget5;
      case 6:
        return monkWidget6;
      case 7:
        return monkWidget7;
      case 8:
        return monkWidget8;
      case 9:
        return monkWidget9;
      case 10:
        return monkWidget10;
      case 11:
        return monkWidget11;
      case 12:
        return monkWidget12;

      default:
        return monkQuest;
    }
  }

  List<Widget> teacher(int index) {
    switch (index) {
      case 0:
        return teacher1;
      case 1:
        return teacher2;
      case 2:
        return teacher3;
      case 3:
        return teacher4;
      case 4:
        return teacher5;
      case 5:
        return teacher6;
      case 6:
        return teacher7;
      case 7:
        return teacher8;
      case 8:
        return teacher9;
      case 9:
        return teacher10;
      case 10:
        return teacher11;

      default:
        return monkWidget11;
    }
  }

  List<Widget> getData() {
    if (widget.role == "student") {
      return teen(widget.index);
    } else if (widget.role == "parent") {
      return parent(widget.index);
    } else if (widget.role == "monk") {
      return monk(widget.index);
    } else {
      return teacher(widget.index);
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
    CoverPage(
      title: "ก่อนเริ่มทำกิจกรรมมาทำแบบสอบถามกันก่อนนะคะ",
      controller: controller,
      nextPage: 1,
      endPage: 10,
    ),
    CoverQuestionnairePage(
      controller: controller,
      nextPage: 2,
    ),
    PersonalPage(
      controller: controller,
      nextPage: 3,
      role: "student",
    ),
    QuestionAlcoholBehaviorPage(
      controller: controller,
      nextPage: 4,
      type: "pre",
      number: 2,
      endPage: 10,
    ),
    QuestAuditPage(
      controller: controller,
      nextPage: 5,
      type: "pre",
      number: 3,
    ),
    Quest4(
      controller: controller,
      nextPage: 6,
      type: "pre",
      number: 4,
    ),
    Quest5(
      controller: controller,
      nextPage: 7,
      quizType: "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์",
      type: "pre",
      number: 5,
    ),
    Quest5(
      controller: controller,
      nextPage: 8,
      quizType:
          "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์",
      type: "pre",
      number: 6,
    ),
    Quest5(
      controller: controller,
      nextPage: 9,
      quizType:
          "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่",
      type: "pre",
      number: 7,
    ),
    Quest5(
      controller: controller,
      nextPage: 10,
      quizType: "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์",
      endPage: 10,
      type: "pre",
      number: 8,
    ),
  ];
  List<Widget> activity1WidgetList = [
    CoverPage(
      title: activity1[0],
      controller: controller,
      path: "assets/icons/icon_1.png",
      nextPage: 1,
      endPage: 5,
    ),
    Quest1(
      nextPage: 2,
      controller: controller,
      prePost: 'Pre Test',
      fail: 3,
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
    Quest1(
      controller: controller,
      prePost: 'Post Test',
      nextPage: 5,
      endPage: 5,
      fail: 3,
    ),
  ];
  List<Widget> activity2WidgetList = [
    CoverPage(
      title: activity2[0],
      controller: controller,
      path: "assets/icons/icon_2.png",
      nextPage: 1,
    ),
    Quest2(
      controller: controller,
      nextPage: 2,
      prePost: 'Pre Test',
      fail: 2,
    ),
    VideoPlayPage(
      link: activity2[2],
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    Quest2(
      controller: controller,
      nextPage: 4,
      prePost: 'Post Test',
      endPage: 4,
      fail: 2,
    ),
  ];
  List<Widget> activity3WidgetList = [
    CoverPage(
      title: activity3[0],
      controller: controller,
      path: "assets/icons/icon_3.png",
      nextPage: 1,
    ),
    Quest3(
      controller: controller,
      nextPage: 2,
      prePost: 'Pre Test',
      fail: 2,
    ),
    VideoPlayPage(
      link: activity3[2],
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    Quest3(
      controller: controller,
      nextPage: 4,
      endPage: 4,
      prePost: 'Post Test',
      fail: 2,
    ),
  ];
  List<Widget> activity4WidgetList = [
    CoverPage(
      title: activity4[0],
      controller: controller,
      path: "assets/icons/icon_4.png",
      nextPage: 1,
    ),
    CoverPage(
      title: "ทำอย่างไรเมื่อต้องตัดสินใจเรื่องสำคัญ????",
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity4[1],
      controller: controller,
      nextPage: 3,
    ),
    CoverPage(
      title:
          "เป็นอย่างไรบ้างคะ ทักษะการตัดสินใจยากไหม เรามาเรียนรู้เพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 4,
    ),
    VideoPlayPage(
      link: activity4[2],
      controller: controller,
      nextPage: 5,
    ),
    QuestionPage2(
      learningModel: teenLearning[0],
      controller: controller,
      nextPage: 6,
      endPage: 6,
    ),
  ];
  List<Widget> activity5WidgetList = [
    CoverPage(
      title: activity5[0],
      controller: controller,
      path: "assets/icons/icon_5.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teenFollow[0],
      controller: controller,
      nextPage: 2,
    ),
    CoverPage(
      title: "ควบคุมอารมณ์ตนเอง ทำได้ไม่ยากเลย",
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: activity5[2],
      controller: controller,
      nextPage: 4,
    ),
    CoverPage(
      title: "เรามาเรียนรู้เรื่องการควบคุมอารมณ์เพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      path: "assets/icons/icon_5.png",
      nextPage: 5,
    ),
    VideoPlayPage(
      link: activity5[3],
      controller: controller,
      nextPage: 6,
    ),
    QuestionPage2(
      learningModel: teenLearning[1],
      controller: controller,
      nextPage: 7,
      endPage: 7,
    ),
  ];
  List<Widget> activity6WidgetList = [
    CoverPage(
      title: activity6[0],
      controller: controller,
      path: "assets/icons/icon_6.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teenFollow[1],
      controller: controller,
      nextPage: 2,
    ),
    CoverPage(
      title: "ปฏิเสธอย่างไร ไม่ให้เสียเพื่อน",
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: activity6[2],
      controller: controller,
      nextPage: 4,
    ),
    CoverPage(
      title:
          "การปฏิเสธง่ายกว่าที่คิดใช่ไหมคะ เรามาเรียนรู้เรื่องทักษะการปฏิเสธเพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 5,
    ),
    VideoPlayPage(
      link: activity6[3],
      controller: controller,
      nextPage: 6,
    ),
    QuestionPage2(
      learningModel: teenLearning[2],
      controller: controller,
      nextPage: 7,
      endPage: 7,
    ),
  ];
  List<Widget> activity7WidgetList = [
    CoverPage(
      title: activity7[0],
      controller: controller,
      path: "assets/icons/icon_7.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teenFollow[2],
      controller: controller,
      nextPage: 2,
    ),
    CoverPage(
      title: "เครียด......ทำอย่างไร ",
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: activity7[2],
      controller: controller,
      nextPage: 4,
    ),
    CoverPage(
      title:
          "การผ่อนคลายความเครียดใครๆก็ทำได้จริงไหมคะ เรามาเรียนรู้เรื่องการผ่อนคลายความเครียดเพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 5,
    ),
    VideoPlayPage(
      link: activity7[3],
      controller: controller,
      nextPage: 6,
    ),
    QuestionPage2(
      learningModel: teenLearning[3],
      controller: controller,
      nextPage: 7,
      endPage: 7,
    ),
  ];
  List<Widget> activity8WidgetList = [
    CoverPage(
      title: activity8[0],
      controller: controller,
      path: "assets/icons/icon_16.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teenFollow[3],
      controller: controller,
      nextPage: 2,
    ),
    CoverPage(
      title: "พรหมวิหาร 4 คืออะไร ใครๆรู้บ้าง",
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: activity8[2],
      controller: controller,
      nextPage: 4,
    ),
    CoverPage(
      title:
          "จบไปแล้วสำหรับหลักธรรมะ ความเมตตา มาดูกันต่อนะคะ ว่า ความกรุณาคืออะไร",
      controller: controller,
      nextPage: 5,
    ),
    VideoPlayPage(
      link: activity8[3],
      controller: controller,
      nextPage: 6,
    ),
    QuestionPage2(
      learningModel: teenLearning[4],
      controller: controller,
      nextPage: 7,
      endPage: 7,
    ),
  ];
  List<Widget> activity9WidgetList = [
    CoverPage(
      title: activity9[0],
      controller: controller,
      path: "assets/icons/icon_9.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teenFollow[4],
      controller: controller,
      nextPage: 2,
    ),
    CoverPage(
      title:
          "เรียนเรื่อง เมตตา กรุณาไปแล้ว วันนี้มาดูเรื่อง มุทิตาและอุเบกขากันนะคะ",
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: activity9[2],
      controller: controller,
      nextPage: 4,
    ),
    CoverPage(
      title: "มุทิตา คือความยินดีเมื่อผู้อื่นได้ดี แล้วอุเบกขาละ",
      controller: controller,
      nextPage: 5,
    ),
    VideoPlayPage(
      link: activity9[3],
      controller: controller,
      nextPage: 6,
    ),
    QuestionPage2(
      learningModel: teenLearning[5],
      controller: controller,
      nextPage: 7,
      endPage: 7,
    ),
  ];
  List<Widget> activity10WidgetList = [
    CoverPage(
      title: activity10[0],
      controller: controller,
      path: "assets/icons/icon_10.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teenFollow[5],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: activity10[2],
      controller: controller,
      nextPage: 3,
      esteem: true,
    ),
    QuestionPage10(
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
    // QuestionPage2(
    //   learningModel: teenLearning[6],
    //   controller: controller,
    //   nextPage: 4,
    //   endPage: 4,
    // ),
  ];
  List<Widget> activity11WidgetList = [
    CoverPage(
      title:
          "จบกันไปแล้วนะคะสำหรับกิจกรรมทั้งหมด 10 กิจกรรม เราได้เรียนรู้เรื่องอะไรกันบ้างคะ มาประเมินผลกันหน่อยค่ะ ขอน้อง ๆ ทำแบบสอบถามหน่อยนะคะ",
      controller: controller,
      nextPage: 1,
    ),
    CoverQuestionnairePage(
      controller: controller,
      nextPage: 2,
      before: false,
    ),
    QuestionAlcoholBehaviorPage(
      controller: controller,
      nextPage: 3,
      number: 1,
      endPage: 10,
      type: "post",
    ),
    QuestAuditPage(
      controller: controller,
      nextPage: 4,
      number: 2,
      type: "post",
    ),
    Quest4(
      controller: controller,
      nextPage: 5,
      number: 3,
      type: "post",
    ),
    Quest5(
      controller: controller,
      nextPage: 6,
      quizType: "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์",
      number: 4,
      type: "post",
    ),
    Quest5(
      controller: controller,
      nextPage: 7,
      number: 5,
      quizType:
          "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์",
    ),
    Quest5(
      controller: controller,
      nextPage: 8,
      number: 6,
      quizType:
          "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่",
      type: "post",
    ),
    Quest5(
      controller: controller,
      nextPage: 9,
      number: 7,
      quizType: "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์",
      type: "post",
    ),
    CoverPage(
      title:
          "ขอบคุณน้อง ๆ ทุกคนที่ตั้งใจทำกิจกรรมและตอบแบบสอบถามทั้งหมด พบกันใหม่หลังจากนี้ 1 เดือนนะคะ",
      controller: controller,
      nextPage: 10,
      endPage: 10,
    ),
  ];

  List<Widget> parentQuestWidget = [
    CoverPage(
      title: "ก่อนเริ่มทำกิจกรรมมาทำแบบสอบถามกันก่อนนะคะ",
      controller: controller,
      path: "assets/icons/icon_10.png",
      nextPage: 1,
    ),
    PersonalPage(
      controller: controller,
      nextPage: 2,
      role: "parent",
    ),
    QuestionAlcoholBehaviorPage(
      controller: controller,
      nextPage: 3,
      type: "pre",
      number: 2,
      endPage: 4,
    ),
    QuestAuditPage(
      controller: controller,
      nextPage: 4,
      endPage: 4,
      type: "pre",
      number: 3,
    ),
  ];
  List<Widget> parentWidget1 = [
    CoverPage(
      title: parent1[0],
      controller: controller,
      path: "assets/icons/icon_1.png",
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
      path: "assets/icons/icon_2.png",
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
      path: "assets/icons/icon_3.png",
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
      path: "assets/icons/icon_4.png",
      nextPage: 1,
    ),
    CoverPage(
      title: "ทำอย่างไรเมื่อต้องตัดสินใจเรื่องสำคัญ????",
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: parent4[1],
      controller: controller,
      nextPage: 3,
    ),
    CoverPage(
      title:
          "เป็นอย่างไรบ้างคะ ทักษะการตัดสินใจยากไหม เรามาเรียนรู้เพิ่มเติมกันเถอะ",
      controller: controller,
      nextPage: 4,
    ),
    VideoPlayPage(
      link: parent4[2],
      controller: controller,
      nextPage: 5,
    ),
    QuestionPage2(
      learningModel: parentLearning[0],
      controller: controller,
      nextPage: 6,
      endPage: 6,
    )
  ];
  List<Widget> parentWidget5 = [
    CoverPage(
      title: parent5[0],
      controller: controller,
      path: "assets/icons/icon_5.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: parentFollow[0],
      controller: controller,
      nextPage: 2,
    ),
    CoverPage(
      title: "ควบคุมอารมณ์ตนเอง ทำได้ไม่ยากเลย",
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: parent5[1],
      controller: controller,
      nextPage: 4,
    ),
    CoverPage(
      title: "เรามาเรียนรู้การควบคุมอารมณ์เพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 5,
    ),
    VideoPlayPage(
      link: parent5[2],
      controller: controller,
      nextPage: 6,
    ),
    QuestionPage2(
      learningModel: parentLearning[1],
      controller: controller,
      nextPage: 7,
      endPage: 7,
    )
  ];
  List<Widget> parentWidget6 = [
    CoverPage(
      title: parent6[0],
      controller: controller,
      path: "assets/icons/icon_6.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: parentFollow[1],
      controller: controller,
      nextPage: 2,
    ),
    CoverPage(
      title: "ปฏิเสธอย่างไร ไม่ให้เสียเพื่อน",
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: parent6[1],
      controller: controller,
      nextPage: 4,
    ),
    CoverPage(
      title:
          "การปฏิเสธง่ายกว่าที่คิดใช่ไหมคะ เรามาเรียนรู้เรื่องทักษะการปฏิเสธเพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 5,
    ),
    VideoPlayPage(
      link: parent6[2],
      controller: controller,
      nextPage: 6,
    ),
    QuestionPage2(
      learningModel: parentLearning[2],
      controller: controller,
      nextPage: 7,
      endPage: 7,
    )
  ];
  List<Widget> parentWidget7 = [
    CoverPage(
      title: parent7[0],
      controller: controller,
      path: "assets/icons/icon_7.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: parentFollow[2],
      controller: controller,
      nextPage: 2,
    ),
    CoverPage(
      title: "เครียด......ทำอย่างไร ",
      controller: controller,
      nextPage: 3,
    ),
    VideoPlayPage(
      link: parent7[1],
      controller: controller,
      nextPage: 4,
    ),
    CoverPage(
      title:
          "การผ่อนคลายความเครียดใครๆก็ทำได้จริงไหมคะ เรามาเรียนรู้เรื่องการผ่อนคลายความเครียดเพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 5,
    ),
    VideoPlayPage(
      link: parent7[2],
      controller: controller,
      nextPage: 6,
    ),
    QuestionPage2(
      learningModel: parentLearning[3],
      controller: controller,
      nextPage: 7,
      endPage: 7,
    )
  ];
  List<Widget> parentWidget8 = [
    CoverPage(
      title: parent8[0],
      controller: controller,
      path: "assets/icons/icon_16.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: parentFollow[3],
      controller: controller,
      nextPage: 2,
      endPage: 4,
    ),
    VideoPlayPage(
      link: parent8[1],
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    QuestionPage2(
      learningModel: parentLearning[4],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    )
  ];
  List<Widget> parentWidget9 = [
    CoverPage(
      title: parent9[0],
      controller: controller,
      path: "assets/icons/icon_9.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: parentFollow[4],
      controller: controller,
      nextPage: 2,
      endPage: 4,
    ),
    VideoPlayPage(
      link: parent9[1],
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    QuestionPage2(
      learningModel: parentLearning[5],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    )
  ];
  List<Widget> parentWidget10 = [
    CoverPage(
      title: parent10[0],
      controller: controller,
      path: "assets/icons/icon_10.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: parentFollow[5],
      controller: controller,
      nextPage: 2,
      endPage: 4,
    ),
    VideoPlayPage(
      link: parent10[1],
      controller: controller,
      nextPage: 3,
      endPage: 4,
    ),
    QuestionPage2(
      learningModel: parentLearning[6],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    )
  ];
  List<Widget> parentWidget = [
    CoverPage(
      title:
          "จบกันไปแล้วนะคะสำหรับกิจกรรมทั้งหมด 10 กิจกรรม ผู้ปกครองได้เรียนรู้เรื่องอะไรกันบ้างคะ ขอความร่วมมือผู้ปกครองช่วยทำแบบสอบถามหน่อยนะคะ",
      controller: controller,
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: parentFollow[6],
      controller: controller,
      nextPage: 2,
    ),
    QuestAuditPage(
      controller: controller,
      nextPage: 3,
      number: 1,
      type: "post",
    ),
    CoverPage(
      title:
          "ขอบคุณผู้ปกครองทุกท่านที่ตั้งใจและให้ความร่วมมือในการทำกิจกรรม หวังเป็นอย่างยิ่งว่าท่านจะนำความรู้ที่ได้ไปใช้ในการดูแลบุตรหลาน ให้ห่างไกลจากเครื่องดื่มแอลกอฮอล์นะคะ",
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];

  List<Widget> monkQuest = [
    PersonalPage(
      controller: controller,
      nextPage: 1,
      role: "monk",
      endPage: 1,
    ),
  ];
  List<Widget> monkWidget1 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 1 ความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์ผลกระทบจากการดื่ม",
      controller: controller,
      path: "assets/icons/icon_1.png",
      nextPage: 1,
    ),
    VideoPlayPage(
      link: "monk/activity_1_1.mp4",
      controller: controller,
      nextPage: 2,
      endPage: 3,
    ),
    VideoPlayPage(
      link: "monk/activity_1_2.mp4",
      controller: controller,
      nextPage: 3,
      endPage: 3,
    ),
  ];
  List<Widget> monkWidget2 = [
    CoverPage(
      title: "กิจกรรมครั้งที่ 2 กฏหมายที่เกี่ยวข้องกับเครื่องดื่มแอลกอออล์",
      controller: controller,
      path: "assets/icons/icon_2.png",
      nextPage: 1,
    ),
    VideoPlayPage(
      link: "monk/activity_2.mp4",
      controller: controller,
      nextPage: 2,
      endPage: 2,
    ),
  ];
  List<Widget> monkWidget3 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 3 การเปลี่ยนแปลงและพัฒนาการของวัยรุ่นสาเหตุการดื่มแอลกอฮอล์ของวัยรุ่น",
      controller: controller,
      path: "assets/icons/icon_3.png",
      nextPage: 1,
    ),
    VideoPlayPage(
      link: "monk/activity_3.mp4",
      controller: controller,
      nextPage: 2,
      endPage: 2,
    ),
  ];
  List<Widget> monkWidget4 = [
    CoverPage(
      title: "กิจกรรมครั้งที่ 4 ทักษะชีวิตพิชิตแอลกอฮอล์ : ทักษะการตัดสินใจ",
      controller: controller,
      path: "assets/icons/icon_4.png",
      nextPage: 1,
    ),
    CoverPage(
      title: "ทำอย่างไรเมื่อต้องตัดสินใจเรื่องสำคัญ????",
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "monk/activity_4_1.mp4",
      controller: controller,
      nextPage: 3,
    ),
    CoverPage(
      title:
          "เป็นอย่างไรบ้างคะ ทักษะการตัดสินใจยากไหม เรามาเรียนรู้เพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 4,
    ),
    VideoPlayPage(
      link: "monk/activity_4_2.mp4",
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> monkWidget5 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 5 ทักษะชีวิตพิชิตแอลกอฮอล์ : ทักษะการควบคุมอารมณ์",
      controller: controller,
      path: "assets/icons/icon_5.png",
      nextPage: 1,
    ),
    CoverPage(
      title: "ควบคุมอารมณ์ตนเอง ทำได้ไม่ยากเลย",
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "monk/activity_5_1.mp4",
      controller: controller,
      nextPage: 3,
    ),
    CoverPage(
      title: "เรามาเรียนรู้การควบคุมอารมณ์เพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 4,
    ),
    VideoPlayPage(
      link: "monk/activity_5_2.mp4",
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> monkWidget6 = [
    CoverPage(
      title: "กิจกรรมครั้งที่ 6 ทักษะชีวิตพิชิตแอลกอฮอล์ : ทักษะการปฏิเสธ",
      controller: controller,
      path: "assets/icons/icon_6.png",
      nextPage: 1,
    ),
    CoverPage(
      title: "ปฏิเสธอย่างไร ไม่ให้เสียเพื่อน",
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "monk/activity_6_1.mp4",
      controller: controller,
      nextPage: 3,
    ),
    CoverPage(
      title:
          "การปฏิเสธง่ายกว่าที่คิดใช่ไหมคะ เรามาเรียนรู้เรื่องทักษะการปฏิเสธเพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 4,
    ),
    VideoPlayPage(
      link: "monk/activity_6_2.mp4",
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> monkWidget7 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 7 ทักษะชีวิตพิชิตแอลกอฮอล์ : ทักษะการผ่อนคลายความเครียด",
      controller: controller,
      path: "assets/icons/icon_7.png",
      nextPage: 1,
    ),
    CoverPage(
      title: "เครียด......ทำอย่างไร ",
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "monk/activity_7_1.mp4",
      controller: controller,
      nextPage: 3,
    ),
    CoverPage(
      title:
          "การผ่อนคลายความเครียดใครๆก็ทำได้จริงไหมคะ เรามาเรียนรู้เรื่องการผ่อนคลายความเครียดเพิ่มเติมกันเถอะค่ะ",
      controller: controller,
      nextPage: 4,
    ),
    VideoPlayPage(
      link: "monk/activity_7_2.mp4",
      controller: controller,
      nextPage: 5,
      endPage: 5,
    ),
  ];
  List<Widget> monkWidget8 = [
    CoverPage(
      title: "กิจกรรมครั้งที่ 8 วัดปลอดสุรา (กฏหมาย และ กิจกรรมที่ทําได้ในวัด)",
      controller: controller,
      path: "assets/icons/icon_8.png",
      nextPage: 1,
    ),
    VideoPlayPage(
      link: "monk/activity_8.mp4",
      controller: controller,
      nextPage: 2,
      endPage: 3,
    ),
    QuestionPage2(
      learningModel: monkLearning[0],
      controller: controller,
      nextPage: 3,
      endPage: 3,
    ),
  ];
  List<Widget> monkWidget9 = [
    CoverPage(
      title: "กิจกรรมครั้งที่ 9 ธรรมเทศนานําใจ ป้องกันภัยจากสุรา",
      controller: controller,
      path: "assets/icons/icon_8.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: monkFollow[0],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "monk/activity_9.mp4",
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      learningModel: monkLearning[1],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> monkWidget10 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 10 สื่อสารอย่างไรให้ญาติยมเข้าใจและห่างไกลจากสุรา (เทคนิคการสื่อสารด้วยเสียงตามสาย)",
      controller: controller,
      path: "assets/icons/icon_8.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: monkFollow[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "monk/activity_10.mp4",
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      learningModel: monkLearning[2],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> monkWidget11 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 11 การให้คําปรึกษาวัยรุ่นที่มีปัญหาการใช้สารเสพติด/แอลกอฮอล์",
      controller: controller,
      path: "assets/icons/icon_11.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: monkFollow[2],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "monk/activity_11.mp4",
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      learningModel: monkLearning[3],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> monkWidget12 = [
    QuestionPage2(
      learningModel: monkFollow[3],
      controller: controller,
      nextPage: 1,
    ),
    CoverPage(
      title:
          "จบกันไปแล้วนะคะสำหรับกิจกรรมทั้งหมด 11 กิจกรรม ขอขอบพระคุณพระคุณเจ้า ที่ให้ความร่วมมือในการทำกิจกรรมในครั้งนี้ หวังเป็นอย่างยิ่งว่าพระคุณเจ้าจะนำความรู้ที่ได้ไปดูแลคนในชุมชนของเรา โดยเฉพาะกลุ่มวัยรุ่นให้ห่างไกลจากเครื่องดื่มแอลกอฮอล์ เพื่อประโยชน์ของคนในสังคมต่อไป",
      controller: controller,
      nextPage: 2,
      endPage: 2,
    ),
  ];

  List<Widget> teacher1 = [
    CoverPage(
      title: "ก่อนเริ่มทำกิจกรรมมาทำแบบสอบถามกันก่อนนะคะ",
      controller: controller,
      nextPage: 1,
    ),
    PersonalPage(
      controller: controller,
      nextPage: 2,
      role: "teacher",
    ),
    QuestionAlcoholBehaviorPage(
      controller: controller,
      nextPage: 3,
      type: "pre",
      number: 2,
      endPage: 4,
    ),
    QuestAuditPage(
      controller: controller,
      nextPage: 4,
      endPage: 4,
      type: "pre",
      number: 3,
    ),
  ];
  List<Widget> teacher2 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 1 ความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์ผลกระทบจากการดื่ม",
      controller: controller,
      path: "assets/icons/icon_2.png",
      nextPage: 1,
    ),
    VideoPlayPage(
      link: "monk/activity_1_1.mp4",
      controller: controller,
      nextPage: 2,
      endPage: 3,
    ),
    VideoPlayPage(
      link: "monk/activity_1_2.mp4",
      controller: controller,
      nextPage: 3,
      endPage: 3,
    ),
  ];
  List<Widget> teacher3 = [
    CoverPage(
      title: "กิจกรรมครั้งที่ 2 กฏหมายที่เกี่ยวข้องกับเครื่องดื่มแอลกอออล์",
      controller: controller,
      path: "assets/icons/icon_3.png",
      nextPage: 1,
    ),
    VideoPlayPage(
      link: "monk/activity_2.mp4",
      controller: controller,
      nextPage: 2,
      endPage: 2,
    ),
  ];
  List<Widget> teacher4 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 3 การเปลี่ยนแปลงและพัฒนาการของวัยรุ่นสาเหตุการดื่มแอลกอฮอล์ของวัยรุ่น",
      controller: controller,
      path: "assets/icons/icon_4.png",
      nextPage: 1,
    ),
    VideoPlayPage(
      link: "monk/activity_3.mp4",
      controller: controller,
      nextPage: 2,
      endPage: 2,
    ),
  ];
  List<Widget> teacher5 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 4 บทบาทของครูในการป้องกันการดื่มแอลกอฮอล์ในนักเรียน",
      controller: controller,
      path: "assets/icons/icon_5.png",
      nextPage: 1,
    ),
    VideoPlayPage(
      link: "teacher/activity_4.mp4",
      controller: controller,
      nextPage: 2,
    ),
    QuestionPage2(
      learningModel: teacherLearning[0],
      controller: controller,
      nextPage: 3,
      endPage: 3,
    ),
  ];
  List<Widget> teacher6 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 5 การคัดกรองผู้ที่ติดสารเสพติด/ดื่มเครื่องดื่มแอลกอฮอล์",
      controller: controller,
      path: "assets/icons/icon_6.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teacherFollow[0],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "teacher/activity_5.mp4",
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      learningModel: teacherLearning[1],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> teacher7 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 6 การให้คําปรึกษานักเรียนที่มีปัญหาการใช้สารเสพติด/แอลกอฮอล์",
      controller: controller,
      path: "assets/icons/icon_7.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teacherFollow[1],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "teacher/activity_6.mp4",
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      learningModel: teacherLearning[2],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> teacher8 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 7 การเฝ้าระวังและกํากับติดตามนักเรียนที่มีความเสี่ยงหรือดื่มแอลกอฮอล์",
      controller: controller,
      path: "assets/icons/icon_16.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teacherFollow[2],
      controller: controller,
      nextPage: 2,
    ),
    VideoPlayPage(
      link: "teacher/activity_7.mp4",
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      learningModel: teacherLearning[3],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> teacher9 = [
    CoverPage(
      title:
          "กิจกรรมครั้งที่ 8 การเห็นคุณค่าในตนเอง และการเสริมแรงเพื่อปรับพฤติกรรม",
      controller: controller,
      path: "assets/icons/icon_9.png",
      nextPage: 1,
    ),
    QuestionPage2(
      learningModel: teacherFollow[3],
      controller: controller,
      nextPage: 2,
      endPage: 3,
    ),
    VideoPlayPage(
      link: "teacher/activity_8.mp4",
      controller: controller,
      nextPage: 3,
    ),
    QuestionPage2(
      learningModel: teacherLearning[4],
      controller: controller,
      nextPage: 4,
      endPage: 4,
    ),
  ];
  List<Widget> teacher10 = [
    QuestionPage2(
      learningModel: teacherFollow[4],
      controller: controller,
      nextPage: 1,
      endPage: 1,
    ),
  ];
  List<Widget> teacher11 = [
    CoverPage(
      title:
          "จบกันไปแล้วนะคะสำหรับกิจกรรมทั้งหมด 9 กิจกรรม\nขอความร่วมมือคุณครูผู้ช่วยทำแบบสอบถามหน่อยนะคะ",
      controller: controller,
      nextPage: 1,
    ),
    QuestAuditPage(
      controller: controller,
      nextPage: 2,
      number: 1,
      type: "post",
    ),
    CoverPage(
      title:
          "ขอบคุณคุณครูทุกท่าน ที่ตั้งใจและให้ความร่วมมือในการทำกิจกรรมครั้งนี้ หวังเป็นอย่างยิ่งว่า\nท่านจะนำความรู้ที่ได้ไปใช้ในการดูแลนักเรียน ให้ห่างไกลจากเครื่องดื่มแอลกอฮอล์นะคะ",
      controller: controller,
      nextPage: 3,
      endPage: 3,
    ),
  ];
}
