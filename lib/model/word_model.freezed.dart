// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Words _$WordsFromJson(Map<String, dynamic> json) {
  return _Words.fromJson(json);
}

/// @nodoc
mixin _$Words {
  String get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get means => throw _privateConstructorUsedError;
  String? get spouse => throw _privateConstructorUsedError;
  String? get sentence => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordsCopyWith<Words> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordsCopyWith<$Res> {
  factory $WordsCopyWith(Words value, $Res Function(Words) then) =
      _$WordsCopyWithImpl<$Res, Words>;
  @useResult
  $Res call(
      {String id,
      String word,
      String means,
      String? spouse,
      String? sentence,
      bool isComplete});
}

/// @nodoc
class _$WordsCopyWithImpl<$Res, $Val extends Words>
    implements $WordsCopyWith<$Res> {
  _$WordsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? means = null,
    Object? spouse = freezed,
    Object? sentence = freezed,
    Object? isComplete = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      means: null == means
          ? _value.means
          : means // ignore: cast_nullable_to_non_nullable
              as String,
      spouse: freezed == spouse
          ? _value.spouse
          : spouse // ignore: cast_nullable_to_non_nullable
              as String?,
      sentence: freezed == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordsCopyWith<$Res> implements $WordsCopyWith<$Res> {
  factory _$$_WordsCopyWith(_$_Words value, $Res Function(_$_Words) then) =
      __$$_WordsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String word,
      String means,
      String? spouse,
      String? sentence,
      bool isComplete});
}

/// @nodoc
class __$$_WordsCopyWithImpl<$Res> extends _$WordsCopyWithImpl<$Res, _$_Words>
    implements _$$_WordsCopyWith<$Res> {
  __$$_WordsCopyWithImpl(_$_Words _value, $Res Function(_$_Words) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? means = null,
    Object? spouse = freezed,
    Object? sentence = freezed,
    Object? isComplete = null,
  }) {
    return _then(_$_Words(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      means: null == means
          ? _value.means
          : means // ignore: cast_nullable_to_non_nullable
              as String,
      spouse: freezed == spouse
          ? _value.spouse
          : spouse // ignore: cast_nullable_to_non_nullable
              as String?,
      sentence: freezed == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Words implements _Words {
  const _$_Words(
      {required this.id,
      required this.word,
      required this.means,
      required this.spouse,
      required this.sentence,
      this.isComplete = false});

  factory _$_Words.fromJson(Map<String, dynamic> json) =>
      _$$_WordsFromJson(json);

  @override
  final String id;
  @override
  final String word;
  @override
  final String means;
  @override
  final String? spouse;
  @override
  final String? sentence;
  @override
  @JsonKey()
  final bool isComplete;

  @override
  String toString() {
    return 'Words(id: $id, word: $word, means: $means, spouse: $spouse, sentence: $sentence, isComplete: $isComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Words &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.means, means) || other.means == means) &&
            (identical(other.spouse, spouse) || other.spouse == spouse) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, word, means, spouse, sentence, isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordsCopyWith<_$_Words> get copyWith =>
      __$$_WordsCopyWithImpl<_$_Words>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordsToJson(
      this,
    );
  }
}

abstract class _Words implements Words {
  const factory _Words(
      {required final String id,
      required final String word,
      required final String means,
      required final String? spouse,
      required final String? sentence,
      final bool isComplete}) = _$_Words;

  factory _Words.fromJson(Map<String, dynamic> json) = _$_Words.fromJson;

  @override
  String get id;
  @override
  String get word;
  @override
  String get means;
  @override
  String? get spouse;
  @override
  String? get sentence;
  @override
  bool get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$_WordsCopyWith<_$_Words> get copyWith =>
      throw _privateConstructorUsedError;
}
