import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/style.dart';

Widget centerHint(BuildContext context) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(
          top: kPad(context) * 0.7,
          left: kPad(context) * .2,
          right: kPad(context) * .2),
      child: Column(
        children: [
          Icon(
            Iconsax.add,
            color: dark.withOpacity(.5),
            size: kPad(context) * 0.07,
          ),
          SizedBox(
            height: kPad(context) * .1,
          ),
          Text(
            'Create a todo Task by clicking on the Add icon on the right top corner.',
            textAlign: TextAlign.center,
            style: style(context).copyWith(
                fontWeight: FontWeight.w500, color: dark.withOpacity(0.5)),
          ),
        ],
      ),
    ),
  );
}
