import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';

class SongsList extends StatelessWidget {
  final List<Song> songs;

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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.title),
                    Text(song.text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey))
                  ],
                ),
              ));
        });
  }
}
