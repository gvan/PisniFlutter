import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/models/songs/category_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  final List<CategoryModel> categories;
  @override
  final bool isLoading;

  const HomeState({required this.categories, required this.isLoading});
}
