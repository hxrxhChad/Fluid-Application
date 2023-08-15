import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_first/utils/system-overlay.dart';

import '../../repositories/lock_repository.dart';
import '../../repositories/todo_repository.dart';

part 'lock_event.dart';
part 'lock_state.dart';

class LockBloc extends Bloc<LockEvent, LockState> {
  final LockRepository _lockRepository;
  final TodoRepository _todoRepository;
  LockBloc(this._lockRepository, this._todoRepository)
      : super(
          HiveBoxOpeningState(),
        ) {
    // hive box opening
    on<HiveBoxOpeningEvent>((event, emit) async {
      systemOverlay();
      try {
        await _lockRepository.init();
        await _todoRepository.init();
      } catch (e) {
        print(e.toString());
      }
      emit(LockInitial());
    });

    // log in
    on<LoginButtonClickedEvent>((event, emit) async {
      final user = await _lockRepository.authenticate(event.code);
      if (user != null) {
        emit(LoggedInState(user));
        emit(LockInitial());
      } else {
        const ErrorState('No records found regarding this user');
      }
    });

    // register
    on<RegisterButtonClickedEvent>((event, emit) async {
      final result = await _lockRepository.registerUser(event.code);
      switch (result) {
        case RegisterResponse.success:
          emit(LoggedInState(event.code));
          break;

        case RegisterResponse.failure:
          emit(const ErrorState(
            "An Error has occurred during Registration, Try again Later.",
          ));
          break;

        case RegisterResponse.alreadyExists:
          emit(const ErrorState(
            'This Account already exists, Try logging in with the code.',
          ));
          break;
        default:
          emit(const ErrorState(
            'Something went wrong, Please try again.',
          ));
      }
    });

    // number pad clicked
    on<NumberPadClickedEvent>((event, emit) {
      //
    });

    // delete button clicked
    on<DeleteButtonClickedEvent>((event, emit) {
      //
    });
  }
}
