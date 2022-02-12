import 'package:flutter/material.dart';

class CardGroup extends StatelessWidget {
  final String? path;
  final String? groupTitle;
  final String? groupTotal;
  final Color? color;
  final Function() onTap;

  const CardGroup({
    Key? key,
    this.path,
    this.color,
    this.groupTitle,
    this.groupTotal,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: color,
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: path == null ? Container() : Image.asset('$path'),
            ),
            Text(
              '$groupTitle',
              style: const TextStyle(color: Colors.white),
            ),
            const Text(
              'จำนวน ... คน',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
