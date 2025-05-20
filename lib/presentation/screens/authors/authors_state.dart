import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/models/songs/category_model.dart' show CategoryModel;

part 'authors_state.freezed.dart';

@freezed
class AuthorsState with _$AuthorsState {
  @override
  final List<CategoryModel> authors;
  @override
  final bool isLoading;

  AuthorsState({required this.authors, required this.isLoading});
}
