import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';
import '../../repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;
  TodoBloc(this._todoRepository) : super(const TodoInitial(0)) {
    // add to do
    on<AddTodoEvent>((event, emit) async {
      // final currentState = state as LoadedTodoListState;
      _todoRepository.addTodos(event.code, event.animationIndex, event.task,
          DateTime.now().millisecondsSinceEpoch, 0);
      emit(const PopState(0));
      // add(LoadTodoListEvent(currentState.code));
    });

    // load todos
    on<LoadTodoListEvent>((event, emit) async {
      final todos = _todoRepository.getTodos(event.code);
      emit(LoadedTodoListState(0, event.code, todos));
    });
    // animation index control
    on<AnimationAddButtonClickedEvent>((event, emit) {
      emit(AnimationGridState(0));
    });
    on<AnimationSelectedEvent>((event, emit) {
      emit(TodoInitial(event.index));
    });

    // mark done
    on<MarkDoneEvent>((event, emit) async {
      await _todoRepository.updateTask(event.code, event.task,
          event.animationIndex, event.time, event.statusIndex);
      add(LoadTodoListEvent(event.code));
      emit(const PopState(0));
    });

    // delete task
    on<DeleteTaskEvent>((event, emit) async {
      await _todoRepository.removeTodos(event.code, event.task);
      add(LoadTodoListEvent(event.code));
      emit(const PopState(0));
    });
  }
}
