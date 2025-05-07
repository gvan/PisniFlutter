import 'package:flutter/material.dart';
import 'package:pisni/ui/common/categories_list.dart';
import 'package:pisni/ui/common/copyright_reference.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/screens/home/home_view_model.dart';

class HomeWidget extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.songs),
      ),
      body: SafeArea(
          child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final categories = viewModel.state.categories;
                return CopyrightReference(
                  child: CategoriesList(categories: categories),
                );
              })),
    );
  }
}
