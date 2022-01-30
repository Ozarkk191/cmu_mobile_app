import 'package:cmu_mobile_app/pages/splash_page.dart';
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
        fontFamily: 'Sarabun',
      ),
      home: const SplashPage(),
    );
  }
}
