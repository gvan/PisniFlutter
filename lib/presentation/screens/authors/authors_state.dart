import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/presentation/entities/songs/category_entity.dart';

part 'authors_state.freezed.dart';

@freezed
class AuthorsState with _$AuthorsState {
  @override
  final List<CategoryEntity> authors;
  @override
  final bool isLoading;

  AuthorsState({required this.authors, required this.isLoading});
}
