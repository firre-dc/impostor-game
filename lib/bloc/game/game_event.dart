part of 'game_bloc.dart';

sealed class GameEvent {}

final class GameStart extends GameEvent {}

final class NextPlayer extends GameEvent {}

final class GameEnd extends GameEvent {}

final class TurnCard extends GameEvent {}
