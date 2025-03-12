import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/entity/song.dart';

part 'song_state.freezed.dart';

@freezed
class SongState with _$SongState {
  @override
  final Song song;

  SongState({required this.song});
  
}
