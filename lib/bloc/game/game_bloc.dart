import 'dart:math';

import 'package:bloc/bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final List<String> names;

  GameBloc({required List<String> initialNames})
      : names = initialNames,
        super(GameState(
          initialNames,
          initialNames.isNotEmpty ? Random().nextInt(initialNames.length) : 0,
        )) {
    on<GameStart>(_onGameStart);
    on<NextPlayer>(_onNextPlayer);
    on<GameEnd>(_onGameEnd);
  }

  void _onGameStart(GameStart event, Emitter<GameState> emit) {
    // Handle game start logic
  }

  void _onNextPlayer(NextPlayer event, Emitter<GameState> emit) {
    // Handle next player logic
  }

  void _onGameEnd(GameEnd event, Emitter<GameState> emit) {
    // Handle game end logic
  }
}
