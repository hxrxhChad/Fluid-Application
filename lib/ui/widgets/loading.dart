import 'package:flutter/material.dart';

import '../../utils/style.dart';

Widget loading(BuildContext context) {
  return Center(
    child: SizedBox(
        height: kPad(context) * 0.12,
        width: kPad(context) * 0.12,
        child: CircularProgressIndicator(
          color: dark.withOpacity(.8),
          strokeWidth: 1,
        )),
  );
}
