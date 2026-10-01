import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/core/presentation/widgets/copyright_reference.dart';
import 'package:pisni/features/songs/domain/entities/song_entity.dart';
import 'package:pisni/core/presentation/extensions/localization.dart';
import 'package:pisni/core/presentation/extensions/styles.dart';
import 'package:pisni/features/songs/presentation/song/cubit/song_cubit.dart';
import 'package:pisni/features/songs/presentation/song/cubit/song_state.dart';

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
    final viewModel = context.read<SongCubit>();
    viewModel.setSong(widget.song);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SongCubit>();

    return BlocBuilder<SongCubit, SongState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(state.song.title),
          actions: [
            IconButton(
              onPressed: () async {
                await viewModel.addToFavorite(state.song);
              },
              icon: Icon(state.isFavorite ? Icons.star : Icons.star_border),
            ),
            IconButton(
              onPressed: () {
                viewModel.shareSong(state.song);
              },
              icon: Icon(Icons.share),
            ),
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
                    if (state.song.author != null &&
                        state.song.author?.isNotEmpty == true)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          '${context.loc.author}: ${state.song.author}',
                          style: context.textStyles.bodySmall,
                        ),
                      ),
                    Text(state.song.text, style: context.textStyles.bodyMedium),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
