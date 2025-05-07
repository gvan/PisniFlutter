import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/common/copyright_reference.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/extensions/styles.dart';
import 'package:pisni/ui/screens/favorite/favorite_view_model.dart';
import 'package:pisni/ui/screens/song/song_view_model.dart';
import 'package:provider/provider.dart';

class SongScreen extends StatefulWidget {
  final Song song;

  const SongScreen({super.key, required this.song});

  @override
  State<StatefulWidget> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read<SongViewModel>();
    viewModel.setSong(widget.song);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SongViewModel>();
    final favoriteViewModel = context.read<FavoriteViewModel>();
    final (Song song, bool isFavorite) = context.select(
        (SongViewModel viewModel) =>
            (viewModel.state.song, viewModel.state.isFavorite));

    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
        actions: [
          IconButton(
              onPressed: () async {
                await viewModel.addToFavorite(song);
                favoriteViewModel.reloadFavoriteSongs();
              },
              icon: Icon(isFavorite ? Icons.star : Icons.star_border)),
          IconButton(
              onPressed: () {
                viewModel.shareSong(song);
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: CopyrightReference(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: Platform.isAndroid || Platform.isIOS
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  if (song.author != null && song.author?.isNotEmpty == true)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${context.loc.author}: ${song.author}',
                        style: context.textStyles.bodySmall,
                      ),
                    ),
                  Text(
                    song.text,
                    style: context.textStyles.bodyMedium,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
