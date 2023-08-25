import 'package:flutter/cupertino.dart';

@immutable
class TrueFalse {
  final String word;
  final List<String> means;
  bool result;

  TrueFalse({required this.word, required this.means, required this.result});

  TrueFalse copyWith({String? word, List<String>? means, bool? result}) {
    return TrueFalse(
        word: word ?? this.word,
        means: means ?? this.means,
        result: result ?? this.result);
  }
}
