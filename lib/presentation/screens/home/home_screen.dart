import 'package:flutter/material.dart';
import 'package:pisni/presentation/common/categories_list.dart';
import 'package:pisni/presentation/common/copyright_reference.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';
import 'package:pisni/presentation/extensions/localization.dart';
import 'package:pisni/presentation/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final (bool isLoading, List<CategoryEntity> categories) = context.select(
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
