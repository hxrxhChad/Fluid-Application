import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_first/utils/style.dart';

Widget customAppBar(
    BuildContext context,
    String title,
    IconData firstIcon,
    void Function() firstIconFunction,
    IconData secondIcon,
    void Function() secondIconFunction) {
  return ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        height: kPad(context) * 0.25,
        width: kPad(context),
        decoration: BoxDecoration(color: white1.withOpacity(0.1)),
        padding: EdgeInsets.symmetric(horizontal: kPad(context) * 0.03),
        child: Center(
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: firstIconFunction,
                    icon: Icon(
                      firstIcon,
                      color: dark.withOpacity(0.5),
                    )),
                Text(
                  title,
                  style: style(context).copyWith(
                      fontSize: kPad(context) * 0.04,
                      fontWeight: FontWeight.w400),
                ),
                IconButton(
                    onPressed: secondIconFunction,
                    icon: Icon(
                      secondIcon,
                      color: dark.withOpacity(0.5),
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
