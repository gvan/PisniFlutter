
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/models/songs/song_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
@override
  final List<SongModel> songs;

  SearchState({required this.songs});
}