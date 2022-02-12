import 'package:cmu_mobile_app/src/widgets/appbar/custom_appbar.dart';
import 'package:cmu_mobile_app/src/widgets/cards/card_group.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

import 'group_page.dart';

class ListGroupPage extends StatelessWidget {
  const ListGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onNextPage(String groupName) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GroupPage(groupName: groupName),
        ),
      );
    }

    return Scaffold(
      body: MainLayout(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomAppbar(
                onTap: () {},
                title: '',
              ),
              const Text(
                'กลุ่ม รพสต.สะรวง',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardGroup(
                    color: const Color(0xff3bbc6f),
                    groupTitle: 'กลุ่ม รพสต สะรวง',
                    onTap: () {
                      _onNextPage("กลุ่ม รพสต สะรวง");
                    },
                  ),
                  CardGroup(
                    color: const Color(0xff71c6f5),
                    groupTitle: 'กลุ่ม วัยรุ่น',
                    path: 'assets/images/ic_teen.png',
                    onTap: () {
                      _onNextPage("กลุ่มวัยรุ่น");
                    },
                  ),
                ],
              ),
              CardGroup(
                color: const Color(0xfff9b931),
                groupTitle: 'กลุ่ม ผู้ปกครอง',
                path: 'assets/images/ic_parent.png',
                onTap: () {
                  _onNextPage("กลุ่มผู้ปกครอง");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardGroup(
                    color: const Color(0xffbb71f5),
                    groupTitle: 'กลุ่ม คุณครู',
                    path: 'assets/images/ic_teacher.png',
                    onTap: () {
                      _onNextPage("กลุ่มคุณครู");
                    },
                  ),
                  CardGroup(
                    color: const Color(0xfff57970),
                    groupTitle: 'กลุ่ม พระสงฆ์',
                    path: 'assets/images/ic_monk.png',
                    onTap: () {
                      _onNextPage("กลุ่มพระสงฆ์");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
