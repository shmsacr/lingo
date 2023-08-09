import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'word_model.freezed.dart';
part 'word_model.g.dart';

@freezed
@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class Words with _$Words {
  @HiveField(0)
  const factory Words({
    @HiveField(1) required final String id,
    @HiveField(2) required final String word,
    @HiveField(3) required final String means,
    @HiveField(4) final String? spouse,
    @HiveField(5) final String? sentence,
    @Default(false) @HiveField(6) final bool isComplete,
  }) = _Words;

  factory Words.fromJson(Map<String, Object?> json) => _$WordsFromJson(json);
}
