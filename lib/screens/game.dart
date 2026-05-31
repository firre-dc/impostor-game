import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impostor_game/bloc/game/game_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () => context.read<GameBloc>().add(TurnCard()),
                      child: Center(child: Text(getText(state))),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.read<GameBloc>().add(NextPlayer()),
                  child: Text("Next"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getText(GameState state) {
    if (!state.roleVisible) {
      return "Press to show your role";
    } else if (state.currentPlayerIndex == state.impostorIndex) {
      return "You are the impostor!";
    } else if (state.currentPlayerIndex < state.names.length) {
      return state.word;
    }
    return "Something went wrong";
  }
}
