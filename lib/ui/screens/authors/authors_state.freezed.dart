// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthorsState {
  List<Category> get authors;

  /// Create a copy of AuthorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorsStateCopyWith<AuthorsState> get copyWith =>
      _$AuthorsStateCopyWithImpl<AuthorsState>(
          this as AuthorsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorsState &&
            const DeepCollectionEquality().equals(other.authors, authors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(authors));

  @override
  String toString() {
    return 'AuthorsState(authors: $authors)';
  }
}

/// @nodoc
abstract mixin class $AuthorsStateCopyWith<$Res> {
  factory $AuthorsStateCopyWith(
          AuthorsState value, $Res Function(AuthorsState) _then) =
      _$AuthorsStateCopyWithImpl;
  @useResult
  $Res call({List<Category> authors});
}

/// @nodoc
class _$AuthorsStateCopyWithImpl<$Res> implements $AuthorsStateCopyWith<$Res> {
  _$AuthorsStateCopyWithImpl(this._self, this._then);

  final AuthorsState _self;
  final $Res Function(AuthorsState) _then;

  /// Create a copy of AuthorsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = null,
  }) {
    return _then(AuthorsState(
      authors: null == authors
          ? _self.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

// dart format on
