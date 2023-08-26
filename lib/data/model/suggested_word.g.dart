// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggested_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


_$_SuggestedWord _$$_SuggestedWordFromJson(Map<String, dynamic> json) =>
    _$_SuggestedWord(
      id: json['id'] as int?,
      categoryId: json['categoryId'] as int?,
      eng: json['eng'] as String?,
      tr: json['tr'] as String?,
    );

Map<String, dynamic> _$$_SuggestedWordToJson(_$_SuggestedWord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'eng': instance.eng,
      'tr': instance.tr,
    };
