part of 'game_bloc.dart';

final class GameState {
  final List<String> names;
  final int impostorIndex;
  final bool roleVisible;
  final int currentPlayerIndex;
  final int starterIndex;
  final GameWord word;
  final bool impostorGetsTip;

  GameState(
    this.names,
    this.impostorIndex,
    this.roleVisible,
    this.currentPlayerIndex,
    this.starterIndex,
    this.word,
    this.impostorGetsTip,
  );

  GameState copyWith({
    List<String>? names,
    int? impostorIndex,
    bool? roleVisible,
    int? currentPlayerIndex,
    int? starterIndex,
    GameWord? word,
    bool? impostorGetsTip,
  }) {
    return GameState(
      names ?? this.names,
      impostorIndex ?? this.impostorIndex,
      roleVisible ?? this.roleVisible,
      currentPlayerIndex ?? this.currentPlayerIndex,
      starterIndex ?? this.starterIndex,
      word ?? this.word,
      impostorGetsTip ?? this.impostorGetsTip,
    );
  }
}
