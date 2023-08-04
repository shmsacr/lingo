import 'package:flutter/cupertino.dart';

@immutable
class TrueFalse {
  final String word;
  final String means;
  final bool result;

  TrueFalse({required this.word, required this.means, required this.result});

  TrueFalse copyWith({String? word, String? means, bool? result}) {
    return TrueFalse(
        word: word ?? this.word,
        means: means ?? this.means,
        result: result ?? this.result);
  }
}
