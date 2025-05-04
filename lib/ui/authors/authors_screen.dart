import 'package:flutter/material.dart';
import 'package:pisni/l10n/app_localizations.dart';
import 'package:pisni/ui/authors/authors_view_model.dart';
import 'package:pisni/ui/common/categories_list.dart';

class AuthorsScreen extends StatelessWidget {
  final AuthorsViewModel viewModel;

  const AuthorsScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context).authors),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final authors = viewModel.state.authors;
                return CategoriesList(categories: authors);
              })),
    );
  }
}
