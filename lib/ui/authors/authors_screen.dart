import 'package:flutter/material.dart';
import 'package:pisni/ui/authors/authors_view_model.dart';

class AuthorsScreen extends StatelessWidget {
  final AuthorsViewModel viewModel;

  const AuthorsScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final authors = viewModel.state.authors;
                return ListView.builder(
                    itemCount: authors.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(authors[index].title),
                      );
                    });
              })),
    );
  }
}
