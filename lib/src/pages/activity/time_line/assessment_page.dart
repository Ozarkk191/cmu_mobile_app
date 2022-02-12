import 'package:cmu_mobile_app/models/quiz_model.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/utils/assessment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';

class AssessmentPage extends StatefulWidget {
  final String groupName;
  final String assessmentType;
  const AssessmentPage({
    Key? key,
    required this.groupName,
    required this.assessmentType,
  }) : super(key: key);

  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  late List<QuizModel> _list;

  void _checkQuiz() {
    switch (widget.assessmentType) {
      case "แบบวัดความมีคุณค่าในตนเอง":
        _list = selfWorthList;
        break;
      case "แบบประเมินปัญหาการดื่มสุรา (AUDIT)":
        _list = alcoholAssessmentList;
        break;

      default:
    }
  }

  @override
  void initState() {
    _checkQuiz();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  widget.assessmentType,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "กลุ่ม ${widget.groupName}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "${(index + 1)}. ${_list[index].quiz!}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          FlutterRadioGroup(
                            titles: _list[index].choice!,
                            labelStyle: const TextStyle(color: Colors.white38),
                            labelVisible: false,
                            label: "",
                            activeColor: const Color(0xffFF6600),
                            titleStyle: const TextStyle(fontSize: 14),
                            defaultSelected: _list[0].selecteChoice,
                            orientation: RGOrientation.VERTICAL,
                            onChanged: (_index) {
                              setState(() {
                                _list[0].selecteChoice = _index!;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                MainButton(
                  ontab: () {},
                  borderRadius: 50,
                  title: 'ถัดไป',
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
