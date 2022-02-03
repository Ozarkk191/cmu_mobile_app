import 'package:cmu_mobile_app/pages/quiz_and_assessment/quiz/question_page.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: Container(
          width: _size.width,
          height: _size.height,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: _size.width * 0.8,
                child: const Text(
                  "กิจกรรมที่ 1 ความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์ ผลกระทบจากการดื่ม",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              MainButton(
                ontab: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QusetionPage(
                        groupName: 'วัยรุ่น',
                        quizType: 'ความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์',
                      ),
                    ),
                  );
                },
                width: _size.width * 0.6,
                borderRadius: 50,
                title: 'เริ่ม',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
