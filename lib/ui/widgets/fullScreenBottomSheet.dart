import 'package:flutter/material.dart';

import '../../utils/style.dart';

fullScreenBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: kPad(context),
          decoration: const BoxDecoration(
              color: white2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kPad(context) * 0.02),
                  child: Center(
                    child: Container(
                      height: kPad(context) * 0.01,
                      width: kPad(context) * 0.15,
                      decoration: BoxDecoration(
                          color: dark.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        );
      });
}
