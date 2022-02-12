import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double? size;
  final String path;
  const CustomAvatar({
    Key? key,
    this.size = 50,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Image.asset(path),
    );
  }
}
