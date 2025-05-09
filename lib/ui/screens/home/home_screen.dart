import 'package:flutter/material.dart';
import 'package:pisni/data/entity/category.dart';
import 'package:pisni/ui/common/categories_list.dart';
import 'package:pisni/ui/common/copyright_reference.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final (bool isLoading, List<Category> categories) = context.select(
      (HomeViewModel viewModel) =>
          (viewModel.state.isLoading, viewModel.state.categories),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.songs),
      ),
      body: CopyrightReference(
        child: Stack(children: [
          if (isLoading) Center(child: CircularProgressIndicator()),
          CategoriesList(categories: categories)
        ]),
      ),
    );
  }
}
