part of 'enter_names_bloc.dart';

@immutable
class EnterNamesState {
  final List<String> names;
  final bool impostorGetsTip;
  const EnterNamesState(this.names, {this.impostorGetsTip = true});
}
