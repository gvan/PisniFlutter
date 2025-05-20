// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongsState {
  List<SongEntity> get songs;
  bool get isLoading;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongsStateCopyWith<SongsState> get copyWith =>
      _$SongsStateCopyWithImpl<SongsState>(this as SongsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongsState &&
            const DeepCollectionEquality().equals(other.songs, songs) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(songs), isLoading);

  @override
  String toString() {
    return 'SongsState(songs: $songs, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $SongsStateCopyWith<$Res> {
  factory $SongsStateCopyWith(
          SongsState value, $Res Function(SongsState) _then) =
      _$SongsStateCopyWithImpl;
  @useResult
  $Res call({List<SongEntity> songs, bool isLoading});
}

/// @nodoc
class _$SongsStateCopyWithImpl<$Res> implements $SongsStateCopyWith<$Res> {
  _$SongsStateCopyWithImpl(this._self, this._then);

  final SongsState _self;
  final $Res Function(SongsState) _then;

  /// Create a copy of SongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
    Object? isLoading = null,
  }) {
    return _then(SongsState(
      songs: null == songs
          ? _self.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongEntity>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
