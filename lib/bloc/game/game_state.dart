part of 'game_bloc.dart';

final class GameState {
  final List<String> names;
  final int impostorIndex;
  final bool roleVisible;

  GameState(this.names, this.impostorIndex, this.roleVisible);

  GameState copyWith({
    List<String>? names,
    int? impostorIndex,
    bool? roleVisible,
  }) {
    return GameState(
      names ?? this.names,
      impostorIndex ?? this.impostorIndex,
      roleVisible ?? this.roleVisible,
    );
  }
}
