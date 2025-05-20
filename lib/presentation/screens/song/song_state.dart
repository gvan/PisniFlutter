import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';

part 'song_state.freezed.dart';

@freezed
class SongState with _$SongState {
  @override
  final SongEntity song;
  @override
  final bool isFavorite;

  SongState({required this.song, required this.isFavorite});
  
}
