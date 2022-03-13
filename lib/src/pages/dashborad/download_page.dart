import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  void launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: _size.width * 0.35,
                height: _size.width * 0.35,
                child: Image.asset('assets/images/app_icon.png'),
              ),
              const SizedBox(height: 20),
              MainButton(
                width: _size.width * 0.7,
                title: "Export data วัยรุ่น",
                ontab: () {
                  launchURL(
                      "https://nurseapi.herokuapp.com/public/api/student/export");
                },
              ),
              const SizedBox(height: 20),
              MainButton(
                width: _size.width * 0.7,
                title: "Export data พ่อแม่",
                ontab: () {
                  launchURL(
                      "https://nurseapi.herokuapp.com/public/api/parent/export");
                },
              ),
              const SizedBox(height: 20),
              MainButton(
                width: _size.width * 0.7,
                title: "Export data คุณครู",
                ontab: () {
                  launchURL(
                      "https://nurseapi.herokuapp.com/public/api/teacher/export");
                },
              ),
              const SizedBox(height: 20),
              MainButton(
                width: _size.width * 0.7,
                title: "Export data พระสงฆ์",
                ontab: () {
                  launchURL(
                      "https://nurseapi.herokuapp.com/public/api/monk/export");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
