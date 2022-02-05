import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class CoverPage extends StatefulWidget {
  final String title;
  final PageController controller;
  final int nextPage;
  const CoverPage({
    Key? key,
    required this.title,
    required this.controller,
    required this.nextPage,
  }) : super(key: key);

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
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
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              MainButton(
                ontab: () {
                  widget.controller.jumpToPage(widget.nextPage);
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
