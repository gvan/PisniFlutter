import 'package:flutter/material.dart';
import 'package:pisni/ui/common/songs_list.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/favorite/favorite_view_model.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  void reloadSongs() {}

  @override
  State<StatefulWidget> createState() {
    return FavoriteScreenState();
  }
}

class FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final songs = context.select(
      (FavoriteViewModel viewModel) => viewModel.state.songs,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(context.loc.favorite),
      ),
      backgroundColor: Colors.white,
      body: SongsList(songs: songs),
    );
  }
}
