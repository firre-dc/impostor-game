import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:impostor_game/bloc/game/game_bloc.dart';

class GameEndScreen extends StatefulWidget {
  final GameState gameState;

  const GameEndScreen({super.key, required this.gameState});

  @override
  State<GameEndScreen> createState() => _GameEndScreenState();
}

class _GameEndScreenState extends State<GameEndScreen> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    final state = widget.gameState;
    final impostorName = state.names[state.impostorIndex];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: Center(
                  child: _revealed
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: [
                            Icon(
                              Icons.warning_amber_rounded,
                              size: 64,
                              color: Colors.red,
                            ),
                            Text(
                              "The Impostor was",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              impostorName,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Divider(),
                            Text(
                              "The word was",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              state.word.word,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(Icons.search, size: 64),
                            Text(
                              "Discuss who the impostor is!",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "${state.names[state.starterIndex]} starts the discussion!",
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "When you are ready, tap the button below to reveal the answer.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                ),
              ),
            ),
            if (!_revealed)
              ElevatedButton(
                onPressed: () => setState(() => _revealed = true),
                child: Text("Reveal the Impostor"),
              )
            else
              ElevatedButton(
                onPressed: () => context.go("/"),
                child: Text("Play Again"),
              ),
          ],
        ),
      ),
    );
  }
}
