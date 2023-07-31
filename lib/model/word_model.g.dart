// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Words _$$_WordsFromJson(Map<String, dynamic> json) => _$_Words(
      id: json['id'] as String,
      word: json['word'] as String,
      means: json['means'] as String,
      spouse: json['spouse'] as String?,
      sentence: json['sentence'] as String?,
      isComplete: json['isComplete'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WordsToJson(_$_Words instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'means': instance.means,
      'spouse': instance.spouse,
      'sentence': instance.sentence,
      'isComplete': instance.isComplete,
    };
