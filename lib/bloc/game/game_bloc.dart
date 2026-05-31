import 'dart:math';

import 'package:bloc/bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final List<String> names;
  static final Random _random = Random();

  GameBloc({required List<String> initialNames, required List<String> words})
    : names = initialNames,
      super(
        GameState(
          initialNames,
          initialNames.isNotEmpty ? _random.nextInt(initialNames.length) : 0,
          false,
          0,
          words[_random.nextInt(words.length)],
        ),
      ) {
    on<NextPlayer>(_onNextPlayer);
    on<TurnCard>(_onTurnCard);
  }

  void _onTurnCard(TurnCard event, Emitter<GameState> emit) {
    emit(state.copyWith(roleVisible: !state.roleVisible));
  }

  void _onNextPlayer(NextPlayer event, Emitter<GameState> emit) {
    emit(
      state.copyWith(
        roleVisible: false,
        currentPlayerIndex: state.currentPlayerIndex + 1,
      ),
    );
  }
}
