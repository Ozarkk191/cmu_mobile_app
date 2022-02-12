import 'dart:async';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';

import '../login_page.dart';

class SubSplashPage extends StatefulWidget {
  const SubSplashPage({Key? key}) : super(key: key);

  @override
  _SubSplashPageState createState() => _SubSplashPageState();
}

class _SubSplashPageState extends State<SubSplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                // height: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  "assets/images/logo1.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    // height: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset(
                      "assets/images/logo2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    // height: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset(
                      "assets/images/logo3.png",
                      fit: BoxFit.cover,
                    ),
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
