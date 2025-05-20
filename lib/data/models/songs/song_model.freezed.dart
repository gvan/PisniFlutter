// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongModel {
  int get id;
  String get title;
  String get text;
  String? get author;
  String? get audio_file_name;
  String? get category;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongModelCopyWith<SongModel> get copyWith =>
      _$SongModelCopyWithImpl<SongModel>(this as SongModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.audio_file_name, audio_file_name) ||
                other.audio_file_name == audio_file_name) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, text, author, audio_file_name, category);

  @override
  String toString() {
    return 'SongModel(id: $id, title: $title, text: $text, author: $author, audio_file_name: $audio_file_name, category: $category)';
  }
}

/// @nodoc
abstract mixin class $SongModelCopyWith<$Res> {
  factory $SongModelCopyWith(SongModel value, $Res Function(SongModel) _then) =
      _$SongModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String text,
      String? author,
      String? audio_file_name,
      String? category});
}

/// @nodoc
class _$SongModelCopyWithImpl<$Res> implements $SongModelCopyWith<$Res> {
  _$SongModelCopyWithImpl(this._self, this._then);

  final SongModel _self;
  final $Res Function(SongModel) _then;

  /// Create a copy of SongModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
    Object? author = freezed,
    Object? audio_file_name = freezed,
    Object? category = freezed,
  }) {
    return _then(SongModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      audio_file_name: freezed == audio_file_name
          ? _self.audio_file_name
          : audio_file_name // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
