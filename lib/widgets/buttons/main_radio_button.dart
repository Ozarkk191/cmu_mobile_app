import 'package:flutter/material.dart';

class MainRadioButton extends StatelessWidget {
  final String title;
  final String textSuffix;
  final bool value;
  final TextEditingController? controller;
  final Function(bool) onChange;
  final bool textfield;
  const MainRadioButton({
    Key? key,
    this.title = "",
    required this.value,
    required this.onChange,
    this.textfield = false,
    this.textSuffix = "",
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChange(value),
      child: Row(
        children: [
          Icon(value ? Icons.radio_button_checked : Icons.radio_button_off),
          const SizedBox(
            width: 5,
          ),
          Text(title),
          Visibility(
            visible: textfield,
            child: SizedBox(
              width: 80,
              child: TextField(
                enabled: value,
                controller: controller,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
              ),
            ),
          ),
          Visibility(
            visible: textfield,
            child: Text(textSuffix),
          ),
        ],
      ),
    );
  }
}
