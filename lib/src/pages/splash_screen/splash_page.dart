import 'dart:async';
import 'package:cmu_mobile_app/src/pages/splash_screen/sub_splash_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SubSplashPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    "assets/images/app_icon.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Image.asset(
            //     "assets/images/bg.png",
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
