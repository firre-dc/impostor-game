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
          body: SizedBox.expand(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Card(
                child: Center(child: Text("Impostor Game")),
              ),
            ),
          ),
        );
      },
    );
  }
}
