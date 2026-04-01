import 'package:flutter/material.dart';

class EnterNames extends StatelessWidget {
  const EnterNames({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter names"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Enter name"),
          )
        ],
      ),
    );
  }
}