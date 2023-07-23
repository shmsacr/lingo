import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_model.freezed.dart';
part 'word_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Words with _$Words {
  const factory Words({
    required final String id,
    required final String word,
    required final String means,
    required final String? spouse,
    required final String? sentence,
    @Default(false) final bool isComplete,
  }) = _Words;

  factory Words.fromJson(Map<String, Object?> json) => _$WordsFromJson(json);
}
