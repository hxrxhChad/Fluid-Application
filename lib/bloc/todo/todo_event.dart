part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadTodoListEvent extends TodoEvent {
  final int code;

  const LoadTodoListEvent(this.code);
  @override
  List<Object?> get props => [code];
}

class AddTodoEvent extends TodoEvent {
  final int code;
  final String task;
  final int animationIndex;

  const AddTodoEvent(this.code, this.task, this.animationIndex);
  @override
  List<Object?> get props => [code, task, animationIndex];
}

class AnimationAddButtonClickedEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class AnimationSelectedEvent extends TodoEvent {
  final int index;

  const AnimationSelectedEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class MarkDoneEvent extends TodoEvent {
  final int code;
  final String task;
  final int time;
  final int animationIndex;
  final int statusIndex;

  const MarkDoneEvent(
      this.code, this.task, this.time, this.animationIndex, this.statusIndex);
  @override
  List<Object?> get props => [code, task, time, animationIndex, statusIndex];
}

class DeleteTaskEvent extends TodoEvent {
  final int code;
  final String task;

  const DeleteTaskEvent(this.code, this.task);
  @override
  List<Object?> get props => [code, task];
}
