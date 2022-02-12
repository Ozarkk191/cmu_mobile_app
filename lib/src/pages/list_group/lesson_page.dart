import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(
          children: [
            CustomAppbar(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'บทเรียน',
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'บทที่ 1',
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 10),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (val) {}),
                      const Text('ทำแล้ว'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'บทที่ 2',
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 10),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
