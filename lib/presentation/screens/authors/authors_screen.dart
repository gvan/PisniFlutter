import 'package:flutter/material.dart';
import 'package:pisni/l10n/app_localizations.dart';
import 'package:pisni/presentation/common/copyright_reference.dart';
import 'package:pisni/presentation/screens/authors/authors_view_model.dart';
import 'package:pisni/presentation/common/categories_list.dart';
import 'package:provider/provider.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final (isLoading, authors) = context.select(
      (AuthorsViewModel viewModel) =>
          (viewModel.state.isLoading, viewModel.state.authors),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).authors),
      ),
      body: CopyrightReference(
        child: Stack(children: [
          if (isLoading) Center(child: CircularProgressIndicator()),
          CategoriesList(categories: authors)
        ]),
      ),
    );
  }
}
