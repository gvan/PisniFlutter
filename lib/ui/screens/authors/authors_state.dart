import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/entity/category.dart' show Category;

part 'authors_state.freezed.dart';

@freezed
class AuthorsState with _$AuthorsState {
  @override
  final List<Category> authors;
  @override
  final bool isLoading;

  AuthorsState({required this.authors, required this.isLoading});
}
