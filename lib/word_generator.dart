import 'dart:io';

class WordGenerator {
  final List<String> words;

  WordGenerator._(this.words);

  static WordGenerator? fromFile(File wordFile) {
    if (!wordFile.existsSync()) return null;
    try {
      return WordGenerator._(wordFile.readAsLinesSync());
    } catch (_) {
      return null;
    }
  }
}