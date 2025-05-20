import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';

part 'songs_state.freezed.dart';

@freezed
class SongsState with _$SongsState {
  @override
  final List<SongEntity> songs;
  @override
  final bool isLoading;

  SongsState({required this.songs, required this.isLoading});
}
