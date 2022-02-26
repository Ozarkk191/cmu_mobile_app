import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final double width;
  final double height;
  final double fontSize;
  final double borderRadius;
  final Function() ontab;
  final Color color;
  const MainButton({
    Key? key,
    this.title,
    this.width = 100,
    this.height = 40,
    this.borderRadius = 10,
    required this.ontab,
    this.color = const Color(0xffFF6600),
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: Center(
          child: Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
