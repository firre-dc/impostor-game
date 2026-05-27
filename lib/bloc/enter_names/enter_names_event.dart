part of 'enter_names_bloc.dart';

@immutable
sealed class EnterNamesEvent {}

final class EnterName extends EnterNamesEvent {
  final String name;
  EnterName(this.name);
}
