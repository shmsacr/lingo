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
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get word => throw _privateConstructorUsedError;
  @HiveField(3)
  String get means => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get spouse => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get sentence => throw _privateConstructorUsedError;
  @HiveField(6)
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
      {@HiveField(1) String id,
      @HiveField(2) String word,
      @HiveField(3) String means,
      @HiveField(4) String? spouse,
      @HiveField(5) String? sentence,
      @HiveField(6) bool isComplete});
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
      {@HiveField(1) String id,
      @HiveField(2) String word,
      @HiveField(3) String means,
      @HiveField(4) String? spouse,
      @HiveField(5) String? sentence,
      @HiveField(6) bool isComplete});
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
@HiveField(0)
class _$_Words implements _Words {
  const _$_Words(
      {@HiveField(1) required this.id,
      @HiveField(2) required this.word,
      @HiveField(3) required this.means,
      @HiveField(4) this.spouse,
      @HiveField(5) this.sentence,
      @HiveField(6) this.isComplete = false});

  factory _$_Words.fromJson(Map<String, dynamic> json) =>
      _$$_WordsFromJson(json);

  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String word;
  @override
  @HiveField(3)
  final String means;
  @override
  @HiveField(4)
  final String? spouse;
  @override
  @HiveField(5)
  final String? sentence;
  @override
  @JsonKey()
  @HiveField(6)
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
      {@HiveField(1) required final String id,
      @HiveField(2) required final String word,
      @HiveField(3) required final String means,
      @HiveField(4) final String? spouse,
      @HiveField(5) final String? sentence,
      @HiveField(6) final bool isComplete}) = _$_Words;

  factory _Words.fromJson(Map<String, dynamic> json) = _$_Words.fromJson;

  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get word;
  @override
  @HiveField(3)
  String get means;
  @override
  @HiveField(4)
  String? get spouse;
  @override
  @HiveField(5)
  String? get sentence;
  @override
  @HiveField(6)
  bool get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$_WordsCopyWith<_$_Words> get copyWith =>
      throw _privateConstructorUsedError;
}
