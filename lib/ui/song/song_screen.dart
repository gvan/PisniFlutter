import 'package:flutter/material.dart';
import 'package:pisni/data/entity/song.dart';
import 'package:pisni/ui/song/song_view_model.dart';
import 'package:provider/provider.dart';

class SongScreen extends StatefulWidget {
  final Song song;

  const SongScreen({super.key, required this.song});

  @override
  State<StatefulWidget> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read<SongViewModel>();
    viewModel.setSong(widget.song);
  }

  @override
  Widget build(BuildContext context) {
    final song =
        context.select((SongViewModel viewModel) => viewModel.state.song);

    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [Text(song.text)],
          ),
        ),
      )),
    );
  }
}
