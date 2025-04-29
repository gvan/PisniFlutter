import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/home/home_view_model.dart';

class HomeWidget extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Пісні'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final categories = viewModel.state.categories;
                return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/songs',
                              arguments: category);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 100,
                                child:
                                    HorizontalSongsList(songs: category.songs),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              })),
    );
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
