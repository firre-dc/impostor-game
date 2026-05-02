import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impostor_game/bloc/enter_names/enter_names_bloc.dart';
import 'package:impostor_game/router.dart';

class ImpostorApp extends StatelessWidget {
  const ImpostorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EnterNamesBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Impostor Game',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
      ),
    );
  }
}
