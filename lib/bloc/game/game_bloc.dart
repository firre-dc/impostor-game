import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:impostor_game/models/GameWord.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final List<String> names;
  static final Random _random = Random();

  GameBloc({
    required List<String> initialNames,
    required List<GameWord> words,
    bool impostorGetsTip = true,
  }) : names = initialNames,
       super(
         GameState(
           initialNames,
           initialNames.isNotEmpty ? _random.nextInt(initialNames.length) : 0,
           false,
           0,
           0,
           words[_random.nextInt(words.length)],
           impostorGetsTip,
         ),
       ) {
    on<NextPlayer>(_onNextPlayer);
    on<TurnCard>(_onTurnCard);
    on<PickStarter>(_onPickStarter);
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

  void _onPickStarter(PickStarter event, Emitter<GameState> emit) {
    const double impostorWeight = 0.1;
    final double total = state.names.length - 1 + impostorWeight;
    double roll = _random.nextDouble() * total;
    int starterIndex = state.names.length - 1;
    for (int i = 0; i < state.names.length; i++) {
      final double weight = i == state.impostorIndex ? impostorWeight : 1.0;
      if (roll < weight) {
        starterIndex = i;
        break;
      }
      roll -= weight;
    }
    emit(state.copyWith(starterIndex: starterIndex));
  }
}
