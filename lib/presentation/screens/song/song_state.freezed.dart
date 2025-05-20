// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongState {
  Song get song;
  bool get isFavorite;

  /// Create a copy of SongState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongStateCopyWith<SongState> get copyWith =>
      _$SongStateCopyWithImpl<SongState>(this as SongState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongState &&
            (identical(other.song, song) || other.song == song) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song, isFavorite);

  @override
  String toString() {
    return 'SongState(song: $song, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $SongStateCopyWith<$Res> {
  factory $SongStateCopyWith(SongState value, $Res Function(SongState) _then) =
      _$SongStateCopyWithImpl;
  @useResult
  $Res call({Song song, bool isFavorite});
}

/// @nodoc
class _$SongStateCopyWithImpl<$Res> implements $SongStateCopyWith<$Res> {
  _$SongStateCopyWithImpl(this._self, this._then);

  final SongState _self;
  final $Res Function(SongState) _then;

  /// Create a copy of SongState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
    Object? isFavorite = null,
  }) {
    return _then(SongState(
      song: null == song
          ? _self.song
          : song // ignore: cast_nullable_to_non_nullable
              as Song,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
