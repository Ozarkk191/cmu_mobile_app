import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  const CustomAppbar({Key? key, this.title = "", this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: 70,
              height: 70,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/ic_back_button.png",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "$title",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            width: 70,
            height: 70,
          ),
        ],
      ),
    );
  }
}
