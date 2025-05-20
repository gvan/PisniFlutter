
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
@override
  final List<SongEntity> songs;

  SearchState({required this.songs});
}