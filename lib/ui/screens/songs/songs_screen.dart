import 'package:flutter/material.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/common/songs_list.dart';
import 'package:pisni/ui/screens/songs/songs_view_model.dart';
import 'package:provider/provider.dart';

class SongsScreen extends StatefulWidget {
  final Category category;

  const SongsScreen({super.key, required this.category});

  @override
  State<StatefulWidget> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  @override
  Widget build(BuildContext context) {
    final (List<Song> songs, bool isLoaidng) =
        context.select((SongsViewModel viewModel) {
      return (viewModel.state.songs, viewModel.state.isLoading);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.category.title),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          if (isLoaidng)
            Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          SongsList(songs: songs)
        ],
      )),
    );
  }
}
