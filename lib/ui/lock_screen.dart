import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_first/bloc/lock/lock_bloc.dart';
import 'package:todo_first/ui/todo_screen.dart';
import 'package:todo_first/ui/widgets/appBar.dart';
import 'package:todo_first/ui/widgets/buttons.dart';
import 'package:todo_first/utils/style.dart';

import '../bloc/todo/todo_bloc.dart';
import '../repositories/todo_repository.dart';
import '../utils/error_dialog.dart';
import '../utils/navigator.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  int _code = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LockBloc, LockState>(
      listener: (context, state) {
        if (state is ErrorState) {
          oneOptionDialogBar(context, 'Error', state.error, 'Go Back', () {
            pop(context);
          });
        }
        if (state is LoggedInState) {
          popUntil(context);
          replace(
              context,
              BlocProvider(
                create: (context) => TodoBloc(
                  RepositoryProvider.of<TodoRepository>(context),
                )..add(LoadTodoListEvent(_code)),
                child: TodoScreen(
                  code: _code,
                ),
              ));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            customAppBar(context, 'Enter the Code', Iconsax.home3, () {},
                Iconsax.home3, () {}),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kPad(context) * 0.25),
                        child: Text(
                          _code.toString(),
                          style: style(context).copyWith(
                              fontSize: kPad(context) * 0.1,
                              fontWeight: FontWeight.w500),
                        )), // Code - Viewer
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kPad(context) * 0.05),
                      child: GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.3,
                          ),
                          itemBuilder: (context, index) {
                            return numberButton(
                                context,
                                Text(
                                  '${index + 1}',
                                  style: style(context)
                                      .copyWith(fontSize: kPad(context) * 0.05),
                                ), () {
                              // number entering state management
                              setState(() {
                                _code = (_code * 10) + (index + 1);
                              });
                            });
                          }),
                    ), // Number - Pad
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kPad(context) * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          numberButton(
                              context,
                              Icon(
                                CupertinoIcons.delete_left,
                                size: kPad(context) * 0.05,
                                color: Colors.red,
                              ), () {
                            // number delete state management
                            setState(() {
                              _code = (_code ~/ 10);
                            });
                          }),
                          numberButton(
                              context,
                              Text(
                                '0',
                                style: style(context)
                                    .copyWith(fontSize: kPad(context) * 0.05),
                              ), () {
                            setState(() {
                              _code = (_code * 10) + (0);
                            });
                          }),
                          numberButton(
                              context,
                              Icon(
                                Iconsax.tick_circle,
                                size: kPad(context) * 0.05,
                                color: Colors.green,
                              ), () {
                            BlocProvider.of<LockBloc>(context)
                                .add(LoginButtonClickedEvent(_code));
                          }),
                        ],
                      ),
                    ), // Lower - Key
                    SizedBox(
                      height: kPad(context) * 0.1,
                    ),
                    customBlueButton(context, 'Register Instead', () {
                      BlocProvider.of<LockBloc>(context)
                          .add(RegisterButtonClickedEvent(_code));
                    }),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}
