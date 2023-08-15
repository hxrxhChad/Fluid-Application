import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_first/utils/style.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.information,
              size: kPad(context) * 0.1,
            ),
            SizedBox(
              height: kPad(context) * 0.1,
            ),
            Text(
              'Construction under Process',
              style: style(context).copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
