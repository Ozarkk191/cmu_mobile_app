import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class CoverPage extends StatefulWidget {
  final String title;
  final PageController controller;
  final int nextPage;
  final int endPage;
  final String? path;
  const CoverPage({
    Key? key,
    required this.title,
    required this.controller,
    required this.nextPage,
    this.endPage = 100,
    this.path,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.path != null
                  ? SizedBox(
                      width: _size.width * 0.8,
                      height: _size.width * 0.4,
                      child: Image.asset(widget.path!),
                    )
                  : Container(),
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
