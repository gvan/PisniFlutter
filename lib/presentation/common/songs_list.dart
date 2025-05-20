import 'package:flutter/material.dart';
import 'package:pisni/presentation/entities/songs/song_entity.dart';
import 'package:pisni/presentation/extensions/styles.dart';

class SongsList extends StatelessWidget {
  final List<SongEntity> songs;

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
