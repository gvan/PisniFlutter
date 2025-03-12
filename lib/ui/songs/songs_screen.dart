import 'package:flutter/material.dart';
import 'package:pisni/ui/songs/songs_view_model.dart';
import 'package:provider/provider.dart';

class SongsScreen extends StatefulWidget {
  final String category;

  const SongsScreen({super.key, required this.category});

  @override
  State<StatefulWidget> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read<SongsViewModel>();
    viewModel.loadSongs(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final songs =
        context.select((SongsViewModel viewModel) => viewModel.state.songs);

    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(songs[index].title),
                    ));
              })),
    );
  }
}
