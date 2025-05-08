import 'package:flutter/material.dart';
import 'package:pisni/ui/common/categories_list.dart';
import 'package:pisni/ui/common/copyright_reference.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.select(
      (HomeViewModel viewModel) => viewModel.state.categories,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.songs),
      ),
      body: CopyrightReference(
        child: CategoriesList(categories: categories),
      ),
    );
  }
}
