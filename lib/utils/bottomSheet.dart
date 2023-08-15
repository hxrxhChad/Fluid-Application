// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_first/utils/style.dart';

class popUpClass {
  final String text;
  final IconData icon;
  final Color iconColor;
  final void Function() press;

  popUpClass(this.text, this.icon, this.iconColor, this.press);
}

bottomSheet(context, List<popUpClass> list) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kPad(context) * 0.03, vertical: kPad(context) * 0.03),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: (kPad(context) * 0.05 +
                    (list.length * (kPad(context) * 0.135))),
                decoration: BoxDecoration(
                    color: white1.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kPad(context) * 0.02),
                      child: Container(
                        height: kPad(context) * 0.01,
                        width: kPad(context) * 0.1,
                        decoration: BoxDecoration(
                            color: dark.withOpacity(.5),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (a, b) {
                              return InkWell(
                                onTap: list[b].press,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: dark.withOpacity(
                                            b == list.length - 1 ? 0 : 0.1),
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(
                                    left: kPad(context) * 0.05,
                                    top: kPad(context) * 0.04,
                                    bottom: kPad(context) * 0.04,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        list[b].icon,
                                        size: kPad(context) * 0.05,
                                        color: list[b].iconColor,
                                      ),
                                      SizedBox(
                                        width: kPad(context) * 0.05,
                                      ),
                                      Text(
                                        list[b].text,
                                        style: style(context).copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
