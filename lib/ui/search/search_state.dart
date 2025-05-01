
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/entity/song.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
final List<Song> songs;

  SearchState({required this.songs});
}