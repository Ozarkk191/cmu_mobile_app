import 'package:cmu_mobile_app/src/pages/list_group/not_done/not_done_page.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "EXPORT DATA",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: _size.width * 0.35,
                height: _size.width * 0.35,
                child: Image.asset('assets/images/app_icon.png'),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainButton(
                        width: _size.width * 0.4,
                        title: "Pretest วัยรุ่น",
                        ontab: () {
                          launchURL(
                              "https://nurseapi.herokuapp.com/public/api/student/export/pre");
                        },
                      ),
                      SizedBox(width: _size.width * 0.05),
                      MainButton(
                        width: _size.width * 0.4,
                        title: "Posttest วัยรุ่น",
                        ontab: () {
                          launchURL(
                              "https://nurseapi.herokuapp.com/public/api/student/export/post");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainButton(
                        width: _size.width * 0.4,
                        title: "Pretest พ่อแม่",
                        ontab: () {
                          launchURL(
                              "https://nurseapi.herokuapp.com/public/api/parent/export/pre");
                        },
                      ),
                      SizedBox(width: _size.width * 0.05),
                      MainButton(
                        width: _size.width * 0.4,
                        title: "Posttest พ่อแม่",
                        ontab: () {
                          launchURL(
                              "https://nurseapi.herokuapp.com/public/api/parent/export/post");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainButton(
                        width: _size.width * 0.4,
                        title: "Pretest คุณครู",
                        ontab: () {
                          launchURL(
                              "https://nurseapi.herokuapp.com/public/api/teacher/export/pre");
                        },
                      ),
                      SizedBox(width: _size.width * 0.05),
                      MainButton(
                        width: _size.width * 0.4,
                        title: "Posttest คุณครู",
                        ontab: () {
                          launchURL(
                              "https://nurseapi.herokuapp.com/public/api/teacher/export/post");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    width: _size.width * 0.85,
                    title: " พระสงฆ์",
                    ontab: () {
                      launchURL(
                          "https://nurseapi.herokuapp.com/public/api/monk/export");
                    },
                  ),
                  const SizedBox(height: 50),
                  MainButton(
                    width: _size.width * 0.85,
                    title: "รายชื่อวัยรุ่นยังไม่ได้ทำกิจกรรม",
                    color: Colors.green,
                    ontab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const NotDonePage(role: "student"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    width: _size.width * 0.85,
                    title: "รายชื่อผู้ปกครองยังไม่ได้ทำกิจกรรม",
                    color: Colors.green,
                    ontab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const NotDonePage(role: "parent"),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
