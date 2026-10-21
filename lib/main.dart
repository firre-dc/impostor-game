// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'models/GameWord.dart';
import 'word_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load words from assets
  final String content = await rootBundle.loadString('res/words.txt');
  final List<GameWord> words = WordGenerator.fromContent(content).words;

  runApp(ImpostorApp(words: words));
}
