import 'package:flutter/material.dart';
import 'package:pisni/presentation/common/copyright_reference.dart';
import 'package:pisni/presentation/common/songs_list.dart';
import 'package:pisni/presentation/extensions/localization.dart';
import 'package:pisni/presentation/screens/search/search_view_model.dart';
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
      body: CopyrightReference(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: context.loc.songTitleOrLyrics),
                onChanged: (text) {
                  viewModel.search(text);
                },
              ),
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
