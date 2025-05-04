import 'package:flutter/material.dart';
import 'package:pisni/ui/common/categories_list.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/home/home_view_model.dart';

class HomeWidget extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(context.loc.songs),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final categories = viewModel.state.categories;
                return CategoriesList(categories: categories);
              })),
    );
  }
}


