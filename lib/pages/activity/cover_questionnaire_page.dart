import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class CoverQuestionnairePage extends StatelessWidget {
  final PageController controller;
  final int nextPage;
  const CoverQuestionnairePage({
    Key? key,
    required this.controller,
    required this.nextPage,
  }) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: _size.width,
                child: Column(
                  children: [
                    const Text(
                      "แบบสอบถาม",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'งานวิจัยเรื่อง ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                '“การพัฒนาโปรแกรมป้องกันการดื่มเครื่องดื่มแอลกอฮอล์ในวัยรุ่น โดยการมีส่วนร่วมของบ้าน  ชุมชน และโรงเรียนในอำเภอแม่ริม จังหวัดเชียงใหม่”',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'คำชี้แจง ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' แบบสอบถามชุดนี้มีทั้งหมด 14 หน้า ประกอบไปด้วยแบบสอบถาม 8 ส่วน คือ',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "       ส่วนที่ 1     แบบสอบถามข้อมูลส่วนบุคคล จำนวน 13 ข้อ",
              ),
              const Text(
                "       ส่วนที่ 2     แบบสอบถามพฤติกรรมการดื่มเครื่องดื่มแอลกอฮอล์ จำนวน 5 ข้อ",
              ),
              const Text(
                "       ส่วนที่ 3     แบบประเมินปัญหาการดื่มสุรา (AUDIT)  จำนวน 10 ข้อ",
              ),
              const Text(
                "       ส่วนที่ 4     แบบวัดความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์  จำนวน 12 ข้อ",
              ),
              const Text(
                "       ส่วนที่ 5     แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์   จำนวน  20 ข้อ",
              ),
              const Text(
                "       ส่วนที่ 6     แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์  จำนวน 14 ข้อ",
              ),
              const Text(
                "       ส่วนที่ 7     แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่ จำนวน 20 ข้อ",
              ),
              const Text(
                "       ส่วนที่ 8     แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์ จำนวน 14 ข้อ",
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: MainButton(
                  ontab: () {
                    controller.jumpToPage(nextPage);
                  },
                  width: _size.width * 0.6,
                  borderRadius: 50,
                  title: 'เริ่ม',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
