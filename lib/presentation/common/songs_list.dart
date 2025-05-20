import 'package:flutter/material.dart';
import 'package:pisni/data/models/songs/song_model.dart';
import 'package:pisni/presentation/extensions/styles.dart';

class SongsList extends StatelessWidget {
  final List<SongModel> songs;

  const SongsList({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/song', arguments: song);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      style: context.textStyles.bodyLarge,
                    ),
                    Text(
                      song.text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.bodySmall,
                    )
                  ],
                ),
              ));
        });
  }
}
