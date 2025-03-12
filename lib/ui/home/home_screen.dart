import 'package:flutter/material.dart';
import 'package:pisni/ui/home/home_view_model.dart';

class HomeWidget extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final categories = viewModel.state.categories;
                return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/songs',
                              arguments: category.id);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(category.title),
                        ),
                      );
                    });
              })),
    );
  }
}
