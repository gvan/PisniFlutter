import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/domain/repository/songs/songs_repository.dart';
import 'package:pisni/domain/entities/songs/song_entity.dart';
import 'package:pisni/presentation/screens/song/song_state.dart';
import 'package:share_plus/share_plus.dart';

class SongCubit extends Cubit<SongState> {
  final SongsRepository songsRepository;

  SongCubit({required this.songsRepository})
    : super(
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
    final isFavorite = await songsRepository.isFavoriteSong(song.id);
    emit(state.copyWith(song: song, isFavorite: isFavorite));
  }

  Future<void> addToFavorite(SongEntity song) async {
    await songsRepository.toggleFavorite(song.id);
    final isFavorite = await songsRepository.isFavoriteSong(song.id);
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
