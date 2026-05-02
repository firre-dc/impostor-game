import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'enter_names_event.dart';
part 'enter_names_state.dart';

class EnterNamesBloc extends Bloc<EnterNamesEvent, EnterNamesState> {
  EnterNamesBloc() : super(EnterNamesState([])) {
    on<EnterName>((event, emit) {
      emit(EnterNamesState([...state.names, event.name]));
    });
  }
}
