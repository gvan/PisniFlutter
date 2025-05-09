import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/entity/category.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  final List<Category> categories;
  @override
  final bool isLoading;

  const HomeState({required this.categories, required this.isLoading});
}
