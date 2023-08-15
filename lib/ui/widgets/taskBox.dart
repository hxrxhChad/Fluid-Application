import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_first/utils/constants.dart';

import '../../utils/style.dart';

Constants _constants = Constants();

Widget taskBox(BuildContext context, String task, int animationIndex,
    int statusIndex, DateTime time) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: kPad(context) * 0.05, vertical: kPad(context) * 0.03),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: dark.withOpacity(0.1)),
          borderRadius: _constants.borderRadius),
      padding: EdgeInsets.symmetric(
          horizontal: kPad(context) * 0.05, vertical: kPad(context) * 0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: kPad(context) * 0.3,
            width: kPad(context) * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: blue.withOpacity(0.1)),
            padding: EdgeInsets.all(kPad(context) * 0.05),
            child: Lottie.asset(
              'assets/$animationIndex.json',
              repeat: true,
              reverse: true,
            ),
          ),
          SizedBox(
            width: kPad(context) * 0.05,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kPad(context) * 0.26,
                  width: kPad(context) * .5,
                  child: Text(
                    task,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: style(context).copyWith(
                        fontSize: kPad(context) * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat('dd MMM, yy').format(time).toString(),
                      style: style(context).copyWith(
                          fontSize: kPad(context) * 0.03,
                          color: dark.withOpacity(0.5)),
                    ),
                    Row(
                      children: [
                        Container(
                          height: kPad(context) * 0.02,
                          width: kPad(context) * 0.02,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: statusIndex == 0
                                  ? Colors.red
                                  : statusIndex == 1
                                      ? Colors.orangeAccent
                                      : Colors.green),
                        ),
                        SizedBox(
                          width: kPad(context) * 0.01,
                        ),
                        Text(
                          statusIndex == 0
                              ? 'Not Completed'
                              : statusIndex == 1
                                  ? 'Working on it'
                                  : 'Done',
                          style: style(context).copyWith(
                              fontSize: kPad(context) * 0.03,
                              color: dark.withOpacity(0.5)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
