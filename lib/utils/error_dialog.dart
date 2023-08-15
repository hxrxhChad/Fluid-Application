import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_first/utils/style.dart';

oneOptionDialogBar(BuildContext context, String title, String description,
    String optionText, void Function() fPress) {
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.1),
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.transparent,
          shadowColor: dark.withOpacity(0.1),
          contentPadding: const EdgeInsets.all(0),
          content: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Container(
                height: kPad(context) * 0.5,
                width: kPad(context) * 0.4,
                decoration: BoxDecoration(
                    color: white1.withOpacity(0.4),
                    border: Border.all(color: dark.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kPad(context) * 0.1),
                            child: Text(
                              title,
                              style: style(context).copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: kPad(context) * 0.045),
                            ),
                          ),
                          SizedBox(
                            height: kPad(context) * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kPad(context) * 0.1),
                            child: Text(
                              description,
                              textAlign: TextAlign.center,
                              style: style(context).copyWith(
                                  fontSize: kPad(context) * 0.038,
                                  color: dark.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: dark.withOpacity(0.2),
                    ),
                    InkWell(
                      onTap: fPress,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: kPad(context) * 0.1,
                          right: kPad(context) * 0.1,
                          top: kPad(context) * 0.03,
                          bottom: kPad(context) * 0.05,
                        ),
                        child: Center(
                          child: Text(
                            optionText,
                            style: style(context).copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: kPad(context) * 0.04),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

loadingDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      barrierColor: white1.withOpacity(0.8),
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
              height: kPad(context) * 0.12,
              width: kPad(context) * 0.12,
              child: CircularProgressIndicator(
                color: white1.withOpacity(.8),
                strokeWidth: 1,
              )),
        );
      });
}
