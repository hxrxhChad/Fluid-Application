part of 'lock_bloc.dart';

abstract class LockEvent extends Equatable {
  const LockEvent();
}

class HiveBoxOpeningEvent extends LockEvent {
  @override
  List<Object?> get props => [];
}

class NumberPadClickedEvent extends LockEvent {
  final int value;

  const NumberPadClickedEvent(this.value);
  @override
  List<Object?> get props => [value];
}

class DeleteButtonClickedEvent extends LockEvent {
  @override
  List<Object?> get props => [];
}

class LoginButtonClickedEvent extends LockEvent {
  final int code;

  const LoginButtonClickedEvent(this.code);
  @override
  List<Object?> get props => [code];
}

class RegisterButtonClickedEvent extends LockEvent {
  final int code;

  const RegisterButtonClickedEvent(this.code);
  @override
  List<Object?> get props => [code];
}
