import 'package:flutter/material.dart';
import 'package:todo_first/utils/constants.dart';

import '../../utils/style.dart';

Constants _constants = Constants();

Widget customTextField(BuildContext context, TextEditingController controller,
    String hint, void Function(String) onChanged, bool obscureText) {
  return Container(
    width: kPad(context) * 0.9,
    constraints: BoxConstraints(minHeight: kPad(context) * 0.15),
    decoration: BoxDecoration(
        color: blue.withOpacity(0.1), borderRadius: _constants.borderRadius),
    padding: EdgeInsets.symmetric(horizontal: kPad(context) * 0.05),
    child: Center(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: blue,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        style:
            style(context).copyWith(color: blue, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: style(context).copyWith(
                color: blue.withOpacity(0.5), fontWeight: FontWeight.w500)),
      ),
    ),
  );
}
