import 'package:flutter/material.dart';
import 'package:todo_first/utils/constants.dart';
import 'package:todo_first/utils/style.dart';

Constants _constants = Constants();

Widget customBlueButton(
    BuildContext context, String label, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: kPad(context) * 0.1,
      width: kPad(context) * 0.8,
      decoration:
          BoxDecoration(color: blue, borderRadius: _constants.borderRadius),
      child: Center(
        child: Text(
          label,
          style: style(context)
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

Widget customWhiteButton(
    BuildContext context, String label, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: kPad(context) * 0.1,
      width: kPad(context) * 0.8,
      decoration: BoxDecoration(
          borderRadius: _constants.borderRadius,
          border: Border.all(color: dark.withOpacity(0.1))),
      child: Center(
        child: Text(
          label,
          style:
              style(context).copyWith(color: dark, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

Widget roundIconButton(
    BuildContext context, IconData icon, void Function() onTap) {
  return IconButton(
      onPressed: onTap,
      iconSize: kPad(context),
      icon: Container(
        decoration: const BoxDecoration(color: blue, shape: BoxShape.circle),
        padding: EdgeInsets.all(kPad(context) * 0.05),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ));
}

Widget numberButton(BuildContext context, Widget icon, void Function() onTap) {
  return IconButton(
    onPressed: onTap,
    iconSize: kPad(context) * 0.2,
    icon: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: dark.withOpacity(0.1))),
        padding: EdgeInsets.all(kPad(context) * 0.07),
        child: icon),
  );
}
