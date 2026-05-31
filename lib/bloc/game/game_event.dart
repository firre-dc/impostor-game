part of 'game_bloc.dart';

sealed class GameEvent {}

final class NextPlayer extends GameEvent {}

final class TurnCard extends GameEvent {}
