import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'state_count_event.dart';
part 'state_count_state.dart';

class StateCountBloc extends Bloc<StateCountEvent, StateCountState> {
  StateCountBloc() : super(StateCountInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(StateCountState(number: state.number! + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(StateCountState(number: state.number! - 1));
    });
  }
}
