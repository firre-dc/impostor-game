import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:impostor_game/bloc/enter_names_bloc.dart';

class EnterNames extends StatelessWidget {
  const EnterNames({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterNamesBloc, EnterNamesState>(
      builder: (context, state) {
        String currentName = "";
        return Scaffold(
          appBar: AppBar(title: Text("Enter names")),
          body: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              spacing: 10,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Enter name"),
                  onChanged: (value) {currentName = value;},
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<EnterNamesBloc>().add(EnterName(currentName));
                  }, child: Text("Enter")
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.names.length,
                  itemBuilder: (context, index) {
                    return Text(state.names[index]);
                  }
                ),
              ],
            ),
          ),
          bottomNavigationBar: ElevatedButton(onPressed: () => context.go('game'), child: Text("Next")),
        );
      },
    );
  }
}
