import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/entity/song.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  @override
  final List<Song> songs;
  @override
  final bool isLoading;

  FavoriteState({required this.songs, required this.isLoading});
}
