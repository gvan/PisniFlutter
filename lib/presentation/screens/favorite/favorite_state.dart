import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  @override
  final List<SongEntity> songs;
  @override
  final bool isLoading;

  FavoriteState({required this.songs, required this.isLoading});
}
