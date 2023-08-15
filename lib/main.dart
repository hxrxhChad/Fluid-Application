import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_first/bloc/lock/lock_bloc.dart';
import 'package:todo_first/repositories/lock_repository.dart';
import 'package:todo_first/repositories/todo_repository.dart';
import 'package:todo_first/ui/lock_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => LockRepository()),
          RepositoryProvider(create: (context) => TodoRepository()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) => LockBloc(
              RepositoryProvider.of<LockRepository>(context),
              RepositoryProvider.of<TodoRepository>(context),
            )..add(HiveBoxOpeningEvent()),
            child: LockScreen(),
          ),
        ));
  }
}
