import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
                      child: Center(
                        child: state.roleVisible
                            ? Text(getText(state))
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(state.names[state.currentPlayerIndex]),
                                  Text("Click to show your role"),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      state.currentPlayerIndex < state.names.length - 1
                      ? context.read<GameBloc>().add(NextPlayer())
                      : context.go("/game_end"),
                  child: Text(
                    state.currentPlayerIndex < state.names.length - 1
                        ? "Next"
                        : "Finish",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getText(GameState state) {
    if (state.currentPlayerIndex == state.impostorIndex) {
      return "You are the impostor!";
    } else if (state.currentPlayerIndex < state.names.length) {
      return state.word;
    }
    return "Something went wrong";
  }
}
