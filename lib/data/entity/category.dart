import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/entity/category_type.dart';
import 'package:pisni/data/entity/song.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@freezed
@JsonSerializable()
class Category with _$Category {
  @override
  final String id;
  @override
  final String title;
  @override
  final List<Song> songs;
  final CategoryType? type;

  Category(
      {required this.id,
      required this.title,
      this.songs = const [],
      this.type});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
