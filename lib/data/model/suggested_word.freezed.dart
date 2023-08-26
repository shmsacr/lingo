// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggested_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SuggestedWord _$SuggestedWordFromJson(Map<String, dynamic> json) {
  return _SuggestedWord.fromJson(json);
}

/// @nodoc
mixin _$SuggestedWord {
  int? get id => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  String? get eng => throw _privateConstructorUsedError;
  String? get tr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestedWordCopyWith<SuggestedWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedWordCopyWith<$Res> {
  factory $SuggestedWordCopyWith(
          SuggestedWord value, $Res Function(SuggestedWord) then) =
      _$SuggestedWordCopyWithImpl<$Res, SuggestedWord>;
  @useResult
  $Res call({int? id, int? categoryId, String? eng, String? tr});
}

/// @nodoc
class _$SuggestedWordCopyWithImpl<$Res, $Val extends SuggestedWord>
    implements $SuggestedWordCopyWith<$Res> {
  _$SuggestedWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? eng = freezed,
    Object? tr = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      eng: freezed == eng
          ? _value.eng
          : eng // ignore: cast_nullable_to_non_nullable
              as String?,
      tr: freezed == tr
          ? _value.tr
          : tr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SuggestedWordCopyWith<$Res>
    implements $SuggestedWordCopyWith<$Res> {
  factory _$$_SuggestedWordCopyWith(
          _$_SuggestedWord value, $Res Function(_$_SuggestedWord) then) =
      __$$_SuggestedWordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? categoryId, String? eng, String? tr});
}

/// @nodoc
class __$$_SuggestedWordCopyWithImpl<$Res>
    extends _$SuggestedWordCopyWithImpl<$Res, _$_SuggestedWord>
    implements _$$_SuggestedWordCopyWith<$Res> {
  __$$_SuggestedWordCopyWithImpl(
      _$_SuggestedWord _value, $Res Function(_$_SuggestedWord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? eng = freezed,
    Object? tr = freezed,
  }) {
    return _then(_$_SuggestedWord(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      eng: freezed == eng
          ? _value.eng
          : eng // ignore: cast_nullable_to_non_nullable
              as String?,
      tr: freezed == tr
          ? _value.tr
          : tr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SuggestedWord implements _SuggestedWord {
  const _$_SuggestedWord({this.id, this.categoryId, this.eng, this.tr});

  factory _$_SuggestedWord.fromJson(Map<String, dynamic> json) =>
      _$$_SuggestedWordFromJson(json);

  @override
  final int? id;
  @override
  final int? categoryId;
  @override
  final String? eng;
  @override
  final String? tr;

  @override
  String toString() {
    return 'SuggestedWord(id: $id, categoryId: $categoryId, eng: $eng, tr: $tr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestedWord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.eng, eng) || other.eng == eng) &&
            (identical(other.tr, tr) || other.tr == tr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, eng, tr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuggestedWordCopyWith<_$_SuggestedWord> get copyWith =>
      __$$_SuggestedWordCopyWithImpl<_$_SuggestedWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SuggestedWordToJson(
      this,
    );
  }
}

abstract class _SuggestedWord implements SuggestedWord {
  const factory _SuggestedWord(
      {final int? id,
      final int? categoryId,
      final String? eng,
      final String? tr}) = _$_SuggestedWord;

  factory _SuggestedWord.fromJson(Map<String, dynamic> json) =
      _$_SuggestedWord.fromJson;

  @override
  int? get id;
  @override
  int? get categoryId;
  @override
  String? get eng;
  @override
  String? get tr;
  @override
  @JsonKey(ignore: true)
  _$$_SuggestedWordCopyWith<_$_SuggestedWord> get copyWith =>
      throw _privateConstructorUsedError;
}
