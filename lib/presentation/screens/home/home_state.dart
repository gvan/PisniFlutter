import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  final List<CategoryEntity> categories;
  @override
  final bool isLoading;

  const HomeState({required this.categories, required this.isLoading});
}
