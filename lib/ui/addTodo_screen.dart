import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_first/ui/todo_screen.dart';
import 'package:todo_first/ui/widgets/buttons.dart';
import 'package:todo_first/ui/widgets/textfields.dart';

import '../bloc/todo/todo_bloc.dart';
import '../repositories/todo_repository.dart';
import '../utils/navigator.dart';
import '../utils/style.dart';

class AddTodoScreen extends StatelessWidget {
  final int code;

  AddTodoScreen({super.key, required this.code});

  final _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is PopState) {
          Navigator.popUntil(context, (route) => route.isCurrent);
          replace(
              context,
              BlocProvider(
                create: (context) => TodoBloc(
                  RepositoryProvider.of<TodoRepository>(context),
                )..add(LoadTodoListEvent(code)),
                child: TodoScreen(code: code),
              ));
        }
      },
      builder: (context, state) {
        if (state is AnimationGridState) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kPad(context) * 0.05),
                  child: Text(
                    'Choose an animation',
                    style: style(context).copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: kPad(context) * 0.04),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kPad(context) * 0.1),
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 15,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: kPad(context) * 0.05,
                        mainAxisSpacing: kPad(context) * 0.05,
                      ),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              BlocProvider.of<TodoBloc>(context)
                                  .add(AnimationSelectedEvent(index + 1));
                            },
                            child: Container(
                              height: kPad(context) * 0.35,
                              width: kPad(context) * 0.35,
                              decoration: BoxDecoration(
                                  color: blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7)),
                              padding: EdgeInsets.all(kPad(context) * 0.05),
                              child: Lottie.asset(
                                'assets/${index + 1}.json',
                                repeat: true,
                                reverse: true,
                              ),
                            ),
                          )),
                )
              ],
            ),
          );
        }
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: kPad(context) * 0.05),
              child: Text(
                'Add a Task',
                style: style(context).copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: kPad(context) * 0.04),
              ),
            ), // header
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kPad(context) * 0.1,
                  vertical: kPad(context) * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      BlocProvider.of<TodoBloc>(context)
                          .add(AnimationAddButtonClickedEvent());
                    },
                    child: Container(
                      height: kPad(context) * 0.35,
                      width: kPad(context) * 0.35,
                      decoration: BoxDecoration(
                          color: blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(7)),
                      padding: EdgeInsets.all(kPad(context) * 0.05),
                      child: state.index == 0
                          ? Icon(
                              Iconsax.add,
                              size: kPad(context) * 0.07,
                              color: blue,
                            )
                          : Lottie.asset(
                              'assets/${state.index}.json',
                            ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Task Date',
                        style: style(context)
                            .copyWith(color: blue, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        DateFormat('dd MMM, yy')
                            .format(DateTime.now())
                            .toString(),
                        style: style(context).copyWith(
                            fontSize: kPad(context) * 0.06,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: kPad(context) * 0.05,
                      ),
                      Text(
                        'Status',
                        style: style(context)
                            .copyWith(color: blue, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: kPad(context) * 0.01,
                      ),
                      Text(
                        'Not Completed',
                        style: style(context).copyWith(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ), // animation row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPad(context) * 0.1),
              child: customTextField(
                  context, _taskController, 'Enter your Task', (p0) {}, false),
            ),
            SizedBox(
              height: kPad(context) * 0.1,
            ),
            customBlueButton(context, 'Submit', () {
              BlocProvider.of<TodoBloc>(context)
                  .add(AddTodoEvent(code, _taskController.text, state.index));
            })
          ],
        );
      },
    );
  }
}
