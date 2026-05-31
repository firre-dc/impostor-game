// lib/word_generator.dart
import 'dart:io';

class WordGenerator {
  final List<String> words;

  WordGenerator(this.words);

  static WordGenerator? fromFile(File wordFile) {
    if (!wordFile.existsSync()) return null;
    try {
      return WordGenerator(wordFile.readAsLinesSync());
    } catch (_) {
      return null;
    }
  }
}
