import 'package:cmu_mobile_app/utils/time_line.dart';
import 'package:flutter/material.dart';

import '../cover_page.dart';
import '../question_page.dart';
import '../question_page2.dart';
import '../video_player_page.dart';

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
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: <Widget>[
              CoverPage(
                title: timeline[0],
                controller: controller,
                nextPage: 1,
              ),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[1],
                controller: controller,
                nextPage: 2,
              ),
              VideoPlayPage(
                link: timeline[2],
                controller: controller,
                nextPage: 3,
              ),
              VideoPlayPage(
                link: timeline[3],
                controller: controller,
                nextPage: 4,
              ),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[4],
                controller: controller,
                nextPage: 5,
              ),
              //--------------------------activity 2
              CoverPage(
                title: timeline[5],
                controller: controller,
                nextPage: 6,
              ),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[6],
                controller: controller,
                nextPage: 7,
              ),
              VideoPlayPage(
                link: timeline[7],
                controller: controller,
                nextPage: 8,
              ),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[8],
                controller: controller,
                nextPage: 9,
              ),
              //--------------------------activity 3
              CoverPage(
                title: timeline[9],
                controller: controller,
                nextPage: 10,
              ),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[10],
                controller: controller,
                nextPage: 11,
              ),
              VideoPlayPage(
                link: timeline[11],
                controller: controller,
                nextPage: 12,
              ),
              QusetionPage(
                groupName: 'วัยรุ่น',
                quizType: timeline[12],
                controller: controller,
                nextPage: 13,
              ),
              //--------------------activity 4
              CoverPage(
                title: timeline[13],
                controller: controller,
                nextPage: 14,
              ),
              VideoPlayPage(
                link: timeline[14],
                controller: controller,
                nextPage: 15,
              ),
              VideoPlayPage(
                link: timeline[15],
                controller: controller,
                nextPage: 16,
              ),
              QuestionPage2(
                activityName: timeline[16],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 17,
              ),
              //--------------------------activity 5
              CoverPage(
                title: timeline[17],
                controller: controller,
                nextPage: 18,
              ),
              VideoPlayPage(
                link: timeline[18],
                controller: controller,
                nextPage: 19,
              ),
              VideoPlayPage(
                link: timeline[19],
                controller: controller,
                nextPage: 20,
              ),
              QuestionPage2(
                activityName: timeline[20],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 21,
              ),
              QuestionPage2(
                activityName: timeline[21],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 22,
              ),
              //--------------------------activity 6
              CoverPage(
                title: timeline[22],
                controller: controller,
                nextPage: 23,
              ),
              VideoPlayPage(
                link: timeline[23],
                controller: controller,
                nextPage: 24,
              ),
              VideoPlayPage(
                link: timeline[24],
                controller: controller,
                nextPage: 25,
              ),
              QuestionPage2(
                activityName: timeline[25],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 26,
              ),
              QuestionPage2(
                activityName: timeline[26],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 27,
              ),
              //--------------------------activity 7
              CoverPage(
                title: timeline[27],
                controller: controller,
                nextPage: 28,
              ),
              VideoPlayPage(
                link: timeline[28],
                controller: controller,
                nextPage: 29,
              ),
              VideoPlayPage(
                link: timeline[29],
                controller: controller,
                nextPage: 30,
              ),
              QuestionPage2(
                activityName: timeline[30],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 31,
              ),
              QuestionPage2(
                activityName: timeline[31],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 32,
              ),
              //--------------------------activity 8
              CoverPage(
                title: timeline[32],
                controller: controller,
                nextPage: 33,
              ),
              VideoPlayPage(
                link: timeline[33],
                controller: controller,
                nextPage: 34,
              ),
              VideoPlayPage(
                link: timeline[34],
                controller: controller,
                nextPage: 35,
              ),
              QuestionPage2(
                activityName: timeline[35],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 36,
              ),
              QuestionPage2(
                activityName: timeline[36],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 37,
              ),
              //--------------------------activity 9
              CoverPage(
                title: timeline[37],
                controller: controller,
                nextPage: 38,
              ),
              VideoPlayPage(
                link: timeline[38],
                controller: controller,
                nextPage: 39,
              ),
              VideoPlayPage(
                link: timeline[39],
                controller: controller,
                nextPage: 40,
              ),
              QuestionPage2(
                activityName: timeline[40],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 41,
              ),
              QuestionPage2(
                activityName: timeline[41],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 42,
              ),
              //--------------------------activity 10
              CoverPage(
                title: timeline[43],
                controller: controller,
                nextPage: 44,
              ),
              VideoPlayPage(
                link: timeline[44],
                controller: controller,
                nextPage: 45,
              ),
              VideoPlayPage(
                link: timeline[45],
                controller: controller,
                nextPage: 46,
              ),
              QuestionPage2(
                activityName: timeline[46],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 47,
              ),
              QuestionPage2(
                activityName: timeline[47],
                groupName: 'วัยรุ่น',
                controller: controller,
                nextPage: 48,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
