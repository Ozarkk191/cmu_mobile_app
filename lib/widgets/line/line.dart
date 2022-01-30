import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double size;
  const Line({Key? key, this.size = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: size,
      color: Colors.teal,
    );
  }
}
