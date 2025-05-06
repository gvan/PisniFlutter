import 'package:flutter/material.dart';
import 'package:pisni/ui/common/songs_list.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/screens/search/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchViewModel>();
    final songs = context.select((SearchViewModel viewModel) {
      return viewModel.state.songs;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.search),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: context.loc.songTitleOrLyrics),
              onChanged: (text) {
                viewModel.search(text);
              },
            ),
            Expanded(
              child: SongsList(songs: songs),
            )
          ],
        ),
      ),
    );
  }
}
