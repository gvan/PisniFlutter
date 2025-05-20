import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/models/songs/song_model.dart';

part 'songs_state.freezed.dart';

@freezed
class SongsState with _$SongsState {
  @override
  final List<SongModel> songs;
  @override
  final bool isLoading;

  SongsState({required this.songs, required this.isLoading});
}
