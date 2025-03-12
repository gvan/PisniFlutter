import 'package:flutter/material.dart';
import 'package:pisni/ui/authors/authors_view_model.dart';

class AuthorsScreen extends StatelessWidget {
  final AuthorsViewModel viewModel;

  const AuthorsScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пісні'),
      ),
      body: SafeArea(
          child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final authors = viewModel.state.authors;
                return ListView.builder(
                    itemCount: authors.length,
                    itemBuilder: (context, index) {
                      final author = authors[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/songs', arguments: author);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(author.title),
                        ),
                      );
                    });
              })),
    );
  }
}
