import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impostor_game/bloc/game/game_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final text = state.roleVisible ? "Impostor" : "Test hello hi";
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () => context.read<GameBloc>().add(TurnCard()),
                      child: Center(child: Text(text)),
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
}
