import 'package:cmu_mobile_app/models/learning_model.dart';
import 'package:cmu_mobile_app/pages/home/home_page.dart';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class QuestionPage2 extends StatefulWidget {
  final LearningModel learningModel;
  final PageController controller;
  final int nextPage;
  final int? endPage;
  const QuestionPage2({
    Key? key,
    required this.controller,
    required this.nextPage,
    this.endPage,
    required this.learningModel,
  }) : super(key: key);

  @override
  _QuestionPage2State createState() => _QuestionPage2State();
}

class _QuestionPage2State extends State<QuestionPage2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: Container(
          width: _size.width,
          height: _size.height,
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.learningModel.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.learningModel.subTitle!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "คำชี้แจง ${widget.learningModel.statment}",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.learningModel.quiz!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: _size.width,
                          child: Text(
                            widget.learningModel.quiz![index],
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _textField(),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    );
                  },
                ),
                MainButton(
                  width: _size.width * 0.5,
                  ontab: () {
                    if (widget.nextPage == widget.endPage) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(initPage: 0),
                        ),
                      );
                    } else {
                      widget.controller.jumpToPage(widget.nextPage);
                    }
                  },
                  borderRadius: 50,
                  title:
                      widget.nextPage == widget.endPage ? 'ส่งคำตอบ' : "ถัดไป",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _textField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        maxLines: 5,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
