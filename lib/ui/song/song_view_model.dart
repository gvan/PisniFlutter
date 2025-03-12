import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/song/song_state.dart';

class SongViewModel extends ChangeNotifier {
  SongState _state =
      SongState(song: Song(id: 0, title: '', text: '', audio_file_name: ''));

  SongState get state => _state;

  void setSong(Song song) {
    _state = _state.copyWith(song: song);
    // notifyListeners();
  }
}
