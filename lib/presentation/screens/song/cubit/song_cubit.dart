import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/domain/entities/songs/song_entity.dart';
import 'package:pisni/domain/usecase/songs/favorite_song_use_case.dart';
import 'package:pisni/domain/usecase/songs/toggle_favorite_song_use_case.dart';
import 'package:pisni/presentation/screens/song/cubit/song_state.dart';
import 'package:share_plus/share_plus.dart';

class SongCubit extends Cubit<SongState> {
  final FavoriteSongUseCase _favoriteSongUseCase;
  final ToggleFavoriteSongUseCase _toggleFavoriteSongUseCase;

  SongCubit({
    required this._favoriteSongUseCase,
    required this._toggleFavoriteSongUseCase,
  }) : super(
         SongState(
           song: SongEntity(
             id: 0,
             title: '',
             text: '',
             author: '',
             audioFileName: '',
             category: '',
           ),
           isFavorite: false,
         ),
       );

  void setSong(SongEntity song) async {
    final isFavorite = await _favoriteSongUseCase(song.id);
    emit(state.copyWith(song: song, isFavorite: isFavorite));
  }

  Future<void> addToFavorite(SongEntity song) async {
    await _toggleFavoriteSongUseCase(song.id);
    final isFavorite = await _favoriteSongUseCase(song.id);
    emit(state.copyWith(isFavorite: isFavorite));
  }

  void shareSong(SongEntity song) {
    final text = StringBuffer();
    text.write(song.title);
    text.write('\n\n');
    if (song.author != null && song.author?.isNotEmpty == true) {
      text.write(song.author);
      text.write('\n\n');
    }
    text.write(song.text);
    SharePlus.instance.share(
      ShareParams(title: song.title, text: text.toString()),
    );
  }
}
