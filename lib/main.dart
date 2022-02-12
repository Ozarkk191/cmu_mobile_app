import 'package:cmu_mobile_app/src/pages/splash_screen/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMU APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Smile',
      ),
      home: const SplashPage(),
    );
  }
}
