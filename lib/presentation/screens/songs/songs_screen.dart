import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/presentation/common/copyright_reference.dart';
import 'package:pisni/presentation/common/songs_list.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';
import 'package:pisni/presentation/screens/songs/songs_state.dart';
import 'package:pisni/presentation/screens/songs/songs_cubit.dart';

class SongsScreen extends StatefulWidget {
  final CategoryEntity category;

  const SongsScreen({super.key, required this.category});

  @override
  State<StatefulWidget> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SongsCubit, SongsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.category.title)),
          body: CopyrightReference(
            child: Stack(
              children: [
                if (state.isLoading)
                  Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                SongsList(songs: state.songs),
              ],
            ),
          ),
        );
      },
    );
  }
}
