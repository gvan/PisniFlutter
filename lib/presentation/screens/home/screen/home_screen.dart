import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/presentation/common/categories_list.dart';
import 'package:pisni/presentation/common/copyright_reference.dart';
import 'package:pisni/presentation/extensions/localization.dart';
import 'package:pisni/presentation/screens/home/cubit/home_state.dart';
import 'package:pisni/presentation/screens/home/cubit/home_cubit.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.songs)),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CopyrightReference(
            child: Stack(
              children: [
                if (state.isLoading) Center(child: CircularProgressIndicator()),
                CategoriesList(categories: state.categories),
              ],
            ),
          );
        },
      ),
    );
  }
}
