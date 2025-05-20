import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/models/songs/song_model.dart';

part 'song_state.freezed.dart';

@freezed
class SongState with _$SongState {
  @override
  final SongModel song;
  @override
  final bool isFavorite;

  SongState({required this.song, required this.isFavorite});
  
}
