import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';

class CoverQuestionnairePage extends StatefulWidget {
  final PageController controller;
  final int nextPage;
  final bool before;
  const CoverQuestionnairePage({
    Key? key,
    required this.controller,
    required this.nextPage,
    this.before = true,
  }) : super(key: key);

  @override
  State<CoverQuestionnairePage> createState() => _CoverQuestionnairePageState();
}

class _CoverQuestionnairePageState extends State<CoverQuestionnairePage> {
  List<String> total = [
    "แบบสอบถามข้อมูลส่วนบุคคล จำนวน 13 ข้อ",
    "แบบสอบถามพฤติกรรมการดื่มเครื่องดื่มแอลกอฮอล์ จำนวน 5 ข้อ",
    "แบบประเมินปัญหาการดื่มสุรา (AUDIT)  จำนวน 10 ข้อ",
    "แบบวัดความรู้เกี่ยวกับเครื่องดื่มแอลกอฮอล์  จำนวน 12 ข้อ",
    "แบบวัดทัศนคติต่อการดื่มเครื่องดื่มแอลกอฮอล์   จำนวน  20 ข้อ",
    "แบบสอบถามการรับรู้สมรรถนะแห่งตนในการปฏิเสธการดื่มเครื่องดื่มแอลกอฮอล์  จำนวน 14 ข้อ",
    "แบบสอบถามการควบคุมและการส่งเสริมการดื่มเครื่องดื่มแอลกอฮอล์ของพ่อแม่ จำนวน 20 ข้อ",
    "แบบวัดความตั้งใจในการไม่ดื่มเครื่องดื่มแอลกอฮอล์ จำนวน 14 ข้อ",
  ];
  @override
  void initState() {
    if (!widget.before) {
      total.removeAt(0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: _size.width,
            height: _size.height,
            color: const Color(0xfffbd4b9),
            padding: const EdgeInsets.all(20),
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
                        style: TextStyle(fontSize: 20),
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '“การพัฒนาโปรแกรมป้องกันการดื่มเครื่องดื่มแอลกอฮอล์ในวัยรุ่น โดยการมีส่วนร่วมของบ้าน  ชุมชน และโรงเรียนในอำเภอแม่ริม จังหวัดเชียงใหม่”',
                              style: TextStyle(
                                fontSize: 12,
                              ),
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' แบบสอบถามชุดนี้มีทั้งหมด 14 หน้า ประกอบไปด้วยแบบสอบถาม 8 ส่วน คือ',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: total.length,
                  itemBuilder: (context, index) {
                    return Text(
                      "       ส่วนที่ ${index + 1}  ${total[index]}",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: MainButton(
                    ontab: () {
                      widget.controller.jumpToPage(widget.nextPage);
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
      ),
    );
  }
}
