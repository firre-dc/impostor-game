// lib/word_generator.dart
import 'package:impostor_game/models/GameWord.dart';

class WordGenerator {
  final List<GameWord> words;

  const WordGenerator(this.words);

  static WordGenerator fromContent(String content) {
    final words = content
        .split('\n')
        .map((line) => parseLine(line))
        .where((gameWord) => gameWord != null)
        .cast<GameWord>()
        .toList();
    return WordGenerator(words);
  }

  static GameWord? parseLine(String line) {
    final trimmedLine = line.trim();
    if (trimmedLine.isEmpty) return null;

    final parts = trimmedLine.split(',');
    final word = parts.first.trim();
    if (word.isEmpty) return null;

    final tip = parts.skip(1).join(',').trim();
    return GameWord(word, tip);
  }
}
