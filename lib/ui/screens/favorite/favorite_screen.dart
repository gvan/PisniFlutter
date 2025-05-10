import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/common/copyright_reference.dart';
import 'package:pisni/ui/common/songs_list.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/extensions/styles.dart';
import 'package:pisni/ui/screens/favorite/favorite_view_model.dart';
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
    final (bool isLoading, List<Song> songs) = context.select(
      (FavoriteViewModel viewModel) =>
          (viewModel.state.isLoading, viewModel.state.songs),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.favorite),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : songs.isEmpty
                ? const _NoFavorites()
                : CopyrightReference(child: SongsList(songs: songs)));
  }
}

class _NoFavorites extends StatelessWidget {
  const _NoFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_border,
            size: 36,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              context.loc.no_favorite_songs,
              style: context.textStyles.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
