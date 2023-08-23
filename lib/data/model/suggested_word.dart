import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'suggested_word.freezed.dart';
part 'suggested_word.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class SuggestedWord with _$SuggestedWord {
  const factory SuggestedWord({
    int? id,
    int? categoryId,
    String? eng,
    String? tr,
  }) = _SuggestedWord;

  factory SuggestedWord.fromJson(Map<String, dynamic> json) =>
      _$SuggestedWordFromJson(json);
}
