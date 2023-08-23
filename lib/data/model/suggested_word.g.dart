// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggested_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SuggestedWord _$$_SuggestedWordFromJson(Map<String, dynamic> json) =>
    _$_SuggestedWord(
      id: json['id'] as int?,
      categoryId: json['categoryId'] as int?,
      eng: json['ENG'] as String?,
      tr: json['TR'] as String?,
    );

Map<String, dynamic> _$$_SuggestedWordToJson(_$_SuggestedWord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'ENG': instance.eng,
      'TR': instance.tr,
    };
