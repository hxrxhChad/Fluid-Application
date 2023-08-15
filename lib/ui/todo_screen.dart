import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_first/repositories/todo_repository.dart';
import 'package:todo_first/ui/addTodo_screen.dart';
import 'package:todo_first/ui/lock_screen.dart';
import 'package:todo_first/ui/widgets/appBar.dart';
import 'package:todo_first/ui/widgets/centerHint.dart';
import 'package:todo_first/ui/widgets/fullScreenBottomSheet.dart';
import 'package:todo_first/ui/widgets/taskBox.dart';
import 'package:todo_first/utils/bottomSheet.dart';
import 'package:todo_first/utils/navigator.dart';
import 'package:todo_first/utils/style.dart';

import '../bloc/lock/lock_bloc.dart';
import '../bloc/todo/todo_bloc.dart';
import '../repositories/lock_repository.dart';

class TodoScreen extends StatelessWidget {
  final int code;

  TodoScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: kPad(context) * 0.2,
                ),
                BlocConsumer<TodoBloc, TodoState>(
                  listener: (context, state) {
                    if (state is PopState) {
                      pop(context);
                      BlocProvider.of<TodoBloc>(context)
                          .add(LoadTodoListEvent(code));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadedTodoListState) {
                      return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          reverse: true,
                          children: [
                            ...state.todos.map((e) => state.todos.isEmpty
                                ? centerHint(context)
                                : InkWell(
                                    onTap: () {
                                      bottomSheet(context, [
                                        popUpClass('Mark as Done',
                                            Iconsax.award, Colors.green, () {
                                          BlocProvider.of<TodoBloc>(context)
                                              .add(MarkDoneEvent(e.code, e.task,
                                                  e.time, e.animationIndex, 2));
                                        }),
                                        popUpClass('Mark as Working on it',
                                            Iconsax.like_1, Colors.orange, () {
                                          BlocProvider.of<TodoBloc>(context)
                                              .add(MarkDoneEvent(e.code, e.task,
                                                  e.time, e.animationIndex, 1));
                                        }),
                                        popUpClass('Delete this Task',
                                            Iconsax.trash, dark, () {
                                          BlocProvider.of<TodoBloc>(context)
                                              .add(DeleteTaskEvent(
                                                  code, e.task));
                                        }),
                                        popUpClass('Remark as Not Completed',
                                            Iconsax.moon, Colors.red, () {
                                          BlocProvider.of<TodoBloc>(context)
                                              .add(MarkDoneEvent(e.code, e.task,
                                                  e.time, e.animationIndex, 0));
                                        }),
                                      ]);
                                    },
                                    child: taskBox(
                                        context,
                                        e.task,
                                        e.animationIndex,
                                        e.statusIndex,
                                        DateTime.fromMillisecondsSinceEpoch(
                                            e.time)),
                                  ))
                          ]);
                    }
                    return centerHint(context);
                  },
                ),
              ],
            )),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: customAppBar(
              context,
              'All Tasks',
              CupertinoIcons.left_chevron,
              () {
                replace(
                    context,
                    BlocProvider(
                      create: (context) => LockBloc(
                        RepositoryProvider.of<LockRepository>(context),
                        RepositoryProvider.of<TodoRepository>(context),
                      )..add(HiveBoxOpeningEvent()),
                      child: LockScreen(),
                    ));
              },
              Iconsax.add,
              () {
                fullScreenBottomSheet(
                    context,
                    BlocProvider(
                      create: (context) => TodoBloc(
                        RepositoryProvider.of<TodoRepository>(context),
                      ),
                      child: AddTodoScreen(
                        code: code,
                      ),
                    ));
              }),
        ),
      ],
    ));
  }
}
