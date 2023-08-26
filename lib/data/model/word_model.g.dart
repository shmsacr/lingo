// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordsAdapter extends TypeAdapter<Words> {
  @override
  final int typeId = 0;

  @override
  Words read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Words(
      id: fields[1] as String,
      word: fields[2] as String,
      means: fields[3] as String,
      spouse: fields[4] as String?,
      sentence: fields[5] as String?,
      isComplete: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Words obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.word)
      ..writeByte(3)
      ..write(obj.means)
      ..writeByte(4)
      ..write(obj.spouse)
      ..writeByte(5)
      ..write(obj.sentence)
      ..writeByte(6)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
