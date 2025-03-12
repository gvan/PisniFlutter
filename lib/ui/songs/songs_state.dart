import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/entity/song.dart';

part 'songs_state.freezed.dart';

@freezed
class SongsState with _$SongsState {
  @override
  final List<Song> songs;

  SongsState({required this.songs});
}
