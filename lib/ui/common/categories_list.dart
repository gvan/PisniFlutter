import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;

  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/songs', arguments: category);
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        category.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture(
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).textTheme.bodyMedium!.color!,
                              BlendMode.srcIn),
                          AssetBytesLoader(
                              'assets/icons/chevron_right.svg.vec'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: HorizontalSongsList(songs: category.songs),
                  ),
                  SizedBox(height: 8),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          );
        });
  }
}

class HorizontalSongsList extends StatelessWidget {
  final List<Song> songs;

  const HorizontalSongsList({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: songs.length,
        itemBuilder: (context, indexed) {
          final song = songs[indexed];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/song', arguments: song);
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(song.text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
