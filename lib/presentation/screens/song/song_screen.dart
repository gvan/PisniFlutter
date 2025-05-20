import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pisni/presentation/common/copyright_reference.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';
import 'package:pisni/presentation/extensions/localization.dart';
import 'package:pisni/presentation/extensions/styles.dart';
import 'package:pisni/presentation/screens/song/song_view_model.dart';
import 'package:provider/provider.dart';

class SongScreen extends StatefulWidget {
  final SongEntity song;

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
    final (SongEntity song, bool isFavorite) = context.select(
        (SongViewModel viewModel) =>
            (viewModel.state.song, viewModel.state.isFavorite));

    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
        actions: [
          IconButton(
              onPressed: () async {
                await viewModel.addToFavorite(song);
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
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
