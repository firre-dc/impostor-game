// lib/router.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import this
import 'package:go_router/go_router.dart';
import 'package:impostor_game/bloc/enter_names/enter_names_bloc.dart';
import 'package:impostor_game/bloc/game/game_bloc.dart';
import 'package:impostor_game/screens/enter_names.dart';
import 'package:impostor_game/screens/game.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const EnterNames(),
    ),
    GoRoute(
      path: '/game',
      builder: (BuildContext context, GoRouterState state) {
        final names = context.read<EnterNamesBloc>().state.names;

        return BlocProvider(
          create: (context) => GameBloc(initialNames: names)..add(GameStart()),
          child: const GamePage(),
        );
      },
    ),
  ],
);
