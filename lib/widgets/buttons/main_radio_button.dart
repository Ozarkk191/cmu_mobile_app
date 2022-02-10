import 'package:flutter/material.dart';

class MainRadioButton extends StatelessWidget {
  final String title;
  final String suffix;
  final Function(String?) onChanged;
  final String groupValue;
  final TextEditingController? controller;
  final bool textField;
  const MainRadioButton({
    Key? key,
    this.title = "",
    this.suffix = "",
    required this.onChanged,
    required this.groupValue,
    this.controller,
    this.textField = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Radio(
            value: title,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          !textField
              ? Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 10),
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(fontSize: 10),
                ),
          Visibility(
            visible: textField,
            child: SizedBox(
              width: 80,
              height: 40,
              child: TextField(
                controller: controller,
                style: const TextStyle(fontSize: 10),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 17),
                ),
              ),
            ),
          ),
          Text(
            suffix,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
