// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load words from assets
  final String content = await rootBundle.loadString('res/words.txt');
  final List<String> words = content.split('\n').where((w) => w.trim().isNotEmpty).toList();

  runApp(ImpostorApp(words: words));
}