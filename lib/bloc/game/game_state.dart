part of 'game_bloc.dart';

final class GameState {
  final List<String> names;
  final int impostorIndex;
  final bool roleVisible;
  final int currentPlayerIndex;
  final String word;

  GameState(
    this.names,
    this.impostorIndex,
    this.roleVisible,
    this.currentPlayerIndex,
    this.word,
  );

  GameState copyWith({
    List<String>? names,
    int? impostorIndex,
    bool? roleVisible,
    int? currentPlayerIndex,
    String? word,
  }) {
    return GameState(
      names ?? this.names,
      impostorIndex ?? this.impostorIndex,
      roleVisible ?? this.roleVisible,
      currentPlayerIndex ?? this.currentPlayerIndex,
      word ?? this.word,
    );
  }
}
