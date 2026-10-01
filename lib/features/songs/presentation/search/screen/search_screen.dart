import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/core/presentation/widgets/copyright_reference.dart';
import 'package:pisni/core/presentation/widgets/songs_list.dart';
import 'package:pisni/core/presentation/extensions/localization.dart';
import 'package:pisni/features/songs/presentation/search/cubit/search_state.dart';
import 'package:pisni/features/songs/presentation/search/cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.search)),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) => CopyrightReference(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: context.loc.songTitleOrLyrics,
                  ),
                  onChanged: (text) {
                    context.read<SearchCubit>().search(text);
                  },
                ),
              ),
              Expanded(child: SongsList(songs: state.songs)),
            ],
          ),
        ),
      ),
    );
  }
}
