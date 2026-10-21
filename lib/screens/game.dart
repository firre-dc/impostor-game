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
                            ? getRoleCard(context, state)
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
                      : context.go("/game_end", extra: state),
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

  Widget getRoleCard(BuildContext context, GameState state) {
    final bool isImpostor = state.currentPlayerIndex == state.impostorIndex;
    final bool showTip =
        isImpostor && state.impostorGetsTip && state.word.tip.isNotEmpty;

    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Text(
            isImpostor ? "You are the impostor!" : state.word.word,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          if (showTip) ...[
            Divider(),
            Text("Tip", style: Theme.of(context).textTheme.titleMedium),
            Text(
              state.word.tip,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
