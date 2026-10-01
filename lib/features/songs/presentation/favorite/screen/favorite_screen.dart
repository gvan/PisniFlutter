import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/core/presentation/widgets/copyright_reference.dart';
import 'package:pisni/core/presentation/widgets/songs_list.dart';
import 'package:pisni/core/presentation/extensions/localization.dart';
import 'package:pisni/core/presentation/extensions/styles.dart';
import 'package:pisni/features/songs/presentation/favorite/cubit/favorite_state.dart';
import 'package:pisni/features/songs/presentation/favorite/cubit/favorite_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  void reloadSongs() {}

  @override
  State<StatefulWidget> createState() {
    return FavoriteScreenState();
  }
}

class FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.favorite)),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.songs.isEmpty
              ? const _NoFavorites()
              : CopyrightReference(child: SongsList(songs: state.songs));
        },
      ),
    );
  }
}

class _NoFavorites extends StatelessWidget {
  const _NoFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star_border, size: 36),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              context.loc.no_favorite_songs,
              style: context.textStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
