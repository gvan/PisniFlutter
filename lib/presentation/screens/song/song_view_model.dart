import 'package:flutter/material.dart';
import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/data/repository/songs/i_songs_repository.dart';
import 'package:pisni/presentation/screens/song/song_state.dart';
import 'package:share_plus/share_plus.dart';

class SongViewModel extends ChangeNotifier {
  final ISongsRepository songsRepository;

  SongState _state = SongState(
      song: SongModel(id: 0, title: '', text: '', author: '', audioFileName: ''),
      isFavorite: false);

  SongViewModel({required this.songsRepository});

  SongState get state => _state;

  void setSong(SongModel song) async {
    final isFavorite = await songsRepository.isFavoriteSong(song.id);
    _state = _state.copyWith(song: song, isFavorite: isFavorite);
    notifyListeners();
  }

  Future<void> addToFavorite(SongModel song) async {
    await songsRepository.toggleFavorite(song.id);
    final isFavorite = await songsRepository.isFavoriteSong(song.id);
    _state = _state.copyWith(isFavorite: isFavorite);
    notifyListeners();
  }

  void shareSong(SongModel song) {
    final text = StringBuffer();
    text.write(song.title);
    text.write('\n\n');
    if (song.author != null && song.author?.isNotEmpty == true) {
      text.write(song.author);
      text.write('\n\n');
    }
    text.write(song.text);
    SharePlus.instance.share(
      ShareParams(
        title: song.title,
        text: text.toString(),
      ),
    );
  }
}
