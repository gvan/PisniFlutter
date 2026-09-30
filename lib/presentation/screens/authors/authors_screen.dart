import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/l10n/app_localizations.dart';
import 'package:pisni/presentation/common/copyright_reference.dart';
import 'package:pisni/presentation/screens/authors/authors_state.dart';
import 'package:pisni/presentation/screens/authors/authors_cubit.dart';
import 'package:pisni/presentation/common/categories_list.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).authors)),
      body: BlocBuilder<AuthorsCubit, AuthorsState>(
        builder: (context, state) {
          return CopyrightReference(
            child: Stack(
              children: [
                if (state.isLoading) Center(child: CircularProgressIndicator()),
                CategoriesList(categories: state.authors),
              ],
            ),
          );
        },
      ),
    );
  }
}
