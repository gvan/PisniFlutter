import 'dart:io';

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
        backgroundColor: Colors.white,
        title: Text(song.title),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: Platform.isAndroid || Platform.isIOS
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [Text(song.text)],
            ),
          ),
        ),
      )),
    );
  }
}
